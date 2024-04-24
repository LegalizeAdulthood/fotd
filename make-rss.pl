#!/usr/bin/perl -w

use DateTime::Format::Mail;
use LWP::Simple;
use XML::RSS;

use POSIX qw(strftime);

my $HOME = $ENV{'HOME'};

sub rfc822Now
{
	my $now = time();

	# We need to munge the timezone indicator to add a colon
	# between the
	# hour and minute part
	my $tz = strftime("%z", localtime($now));
	$tz =~ s/(\d{2})(\d{2})/$1:$2/o;

	# RFC822 (actually RFC2822, as the year has 4 digits)
	return strftime("%a, %d %b %Y %H:%M:%S %z", localtime($now));
}

my $maxItemCount = 250;
my $header = 0;
my $base = "http://user.xmission.com/~legalize";

sub modifiedLastMonth($)
{
	my($path) = @_;
	my $now = DateTime->from_epoch(epoch => time());
	my $mtime = DateTime->from_epoch(epoch => (stat($path))[9]);
	return $now->delta_days($mtime)->delta_days < 31;
}

sub getItems()
{
	my $baseDir = "$HOME/public_html/fractals/fotd";
	opendir(DIR, $baseDir) || die "can't opendir $baseDir: $!";
	my @yearDirs = reverse(sort(grep
		{ /^[0-9][0-9][0-9][0-9]$/ && -d "$baseDir/$_" }
		readdir(DIR)));
	closedir DIR;

	my @monthDirs;
	foreach my $yearDir (@yearDirs)
	{
		$yearDir = "$baseDir/$yearDir";
		opendir(DIR, $yearDir) || die "can't opendir $yearDir: $!";
		push(@monthDirs,
			map { "$yearDir/$_" }
			reverse
			sort
			grep { /^[0-9][0-9]$/ && -d "$yearDir/$_" }
			readdir(DIR));
		closedir(DIR);
	}

	my @paramFiles;
	foreach my $dir (@monthDirs)
	{
		opendir(PARAMS, $dir) || die "can't opendir $dir: $!";
		push @paramFiles,
			map { "$dir/$_" }
			reverse
			sort
			grep { /\.par$/ && -f "$dir/$_" && modifiedLastMonth("$dir/$_") }
			readdir(PARAMS);
		closedir PARAMS;
	}
	return @paramFiles;
}

sub createRssFeed()
{
	my $now = rfc822Now();
	my $rss = new XML::RSS(version => '2.0');
	$rss->channel(title => "Jim Muth's Fractal of the Day",
		link => "http://user.xmission.com/~legalize/fractals/fotd/",
		language => 'en-US',
		description => "New fractal of the day images",
		rating => '(PICS-1.1 "http://www.classify.org/safesurf/" 1 r (SS~~000 1))',
		copyright => 'Copyright 2007-2010, Pahvant Technologies Inc.',
		pubDate => $now,
		lastBuildDate => $now,
		managingEditor => 'legalize@xmission.com',
		webMaster => 'legalize@xmission.com');
	return $rss;
}

sub parSetLines($)
{
	my($path) = @_;
	my($title) = $path;
	open PARSET, "<$path";
	my(@lines) = <PARSET>;
	close PARSET;
	chomp(@lines);
	return \@lines;
}

sub itemTitle($)
{
	my($lines) = @_;
	my($name) = grep { /^[^;][^:]*{/ } @$lines;
	$name =~ s/  *{.*//o;
	$name =~ s/_/ /go;
	return $name;
}

sub itemDescription($@)
{
	my($url, @lines) = @_;
	$url = itemLink($url);
	my($thumb) = $url;
	$thumb =~ s/\.jpg/.thumb.jpg/;
	my($desc) = grep /Subject:/, @lines;
	$desc =~ s/^.*Subject:  *//o;
	$desc =~ s/\(c\)//o;
	$desc =~ s/^.*\((.*)\).*$/$1/o;
	my($foundBody, $foundPar) = (0, 0);
	my(@body);
	my($monthLink) = substr($url, 0, rindex($url, '/'));
	my($monthLinkText) = join('.', (split('/', $monthLink))[-2..-1]);
	push(@body, sprintf('<h3><a href="%s/index.html">%s</a> %s</h3>',
		$monthLink, $monthLinkText, $desc));
	push(@body, '<p>');
	push(@body, sprintf('<a href="%s"><img src="%s" alt="%s" '
		. 'width="256" height="192"/></a>', $url, $thumb, $desc));
	push(@body, '</p>');
	push(@body, '<p>');
	foreach my $line (@lines)
	{
		if ($line eq '; ---------')
		{
			$foundBody = 1;
		}
		elsif (substr($line, 0, 1) ne ';')
		{
			$foundPar = 1;
		}
		elsif ($foundBody && !$foundPar)
		{
			$line =~ s/^; //;
			if ($line eq '')
			{
				push(@body, '</p>');
				push(@body, '<p>');
			}
			elsif (!($line =~ /START PARAMETER/))
			{
				$line =~ s/&/&amp;/g;
				$line =~ s/</&lt;/g;
				$line =~ s/>/&gt;/g;
				push(@body, $line);
			}
		}
	}
	push(@body, '</p>');

	return '<![CDATA[' . join("\n", @body) . ']]>';
}

sub itemEnclosure($)
{
	my($url) = @_;
	my $file_length; # = length(get($url));
	return { url => $url, type => 'text/plain' };
}

sub itemUrl($)
{
	my($path) = @_;
	my $url = $path;
	$url =~ s%$HOME/public_html/%%o;
	$url = "$base/$url";
	return $url;
}

sub parDate($)
{
	my($lines) = @_;
	my($text) = $lines->[0];
	$text =~ s/^;  *Date: //o;
	my $parser = DateTime::Format::Mail->new->loose;
	return $parser->parse_datetime($text);
}

sub itemPubDate($)
{
	my($path) = @_;
	my($mtime) = DateTime->from_epoch(epoch => (stat($path))[9]);
	return DateTime::Format::Mail->format_datetime($mtime);
}

sub itemCategory($)
{
	my($lines) = @_;
	my($date) = parDate($lines);
	return sprintf("%04d.%02d", $date->year, $date->month);
}

sub itemLink($)
{
	my($parUrl) = @_;
	my($jpgUrl) = $parUrl;
	$jpgUrl =~ s/par$/jpg/o;
	return $jpgUrl;
}

sub main()
{
	my $rss = createRssFeed();
	my $count = 0;
	local($_);
	foreach (getItems())
	{
		$count++;
		my($path) = $_;
		my($lines) = parSetLines($path);
		my $title = itemTitle($lines);
		my $url = itemUrl($path);
		$rss->add_item(title => $title,
			 permaLink => $url,
			 link => itemLink($url),
			 enclosure => itemEnclosure($url),
			 description => itemDescription($url, @$lines),
			 category => itemCategory($lines),
			 pubDate => itemPubDate($path));
		if ($count > $maxItemCount)
		{
			last;
		}
	}
	print $rss->as_string;
}

main;
