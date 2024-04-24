#!/usr/bin/perl -w
use IO::Handle;
STDOUT->autoflush(1);

my($fileCount) = 0;

sub startPage($)
{
	my($tmpIndex) = @_;
	open(TMPINDEX, ">$tmpIndex") || die "open $tmpIndex: $!";
	print TMPINDEX << "__End";
<html><head><title>Jim Muth's Fractal of the Day</title>
<link rel="alternate" type="application/rss+xml"
title="Jim Muth's Fractal of the Day RSS Feed"
href="http://www.xmission.com/~legalize/fractals/fotd/fotd-rss.xml" />
</head>
<body>
<h1><a href="../../index.html">Jim Muth's Fractal of the Day</a></h1>
<p><a href="../../about.html">About the Fractal of the Day</a></p>
<table>
<!--PAGE_LINKS-->
<tr>
__End
}

sub endPage()
{
	print TMPINDEX << "__End";
</tr>
</table>
</body>
</html>
__End
	close(TMPINDEX);
}

sub moveFiles()
{
	print "Moving files...\n";
	my($file);
	foreach $file (glob "*.par")
	{
		my($name) = $file;
		$name =~ s/\.par$//o;
		if (-f "$name.jpg")
		{
			my($year, $month) = getYearMonthFromFile($file);
			if (! -d $year)
			{
				mkdir($year);
			}
			my($subdir) = "$year/$month";
			if (! -d $subdir)
			{
				mkdir($subdir);
			}
			rename($file, "$subdir/$file");
			rename("$name.jpg", "$subdir/$name.jpg");
			rename("$name.thumb.jpg", "$subdir/$name.thumb.jpg");
		}
	}
}

sub getYearMonthFromFile($)
{
	my($file) = @_;
	$file =~ s%.*/%%go;
	my($year, $month) = ($file, $file);
	$year =~ s/^(....).*/$1/o;
	$month =~ s/^....\.(..).*/$1/o;
	return ($year, $month);
}

my($lastMonth) = 0;
my($lastYear) = 0;
sub processFile($$);
sub processFile($$)
{
	my($file, $name) = @_;
	my($numPerRow) = 4;
	my($year, $month) = getYearMonthFromFile($name);
	if (($lastMonth != $month) || ($lastYear != $year))
	{
		if ($lastMonth != 0)
		{
			endPage;
		}
		my($tmpIndex) = "$year/$month/tmp.html";
		startPage($tmpIndex);
		$fileCount = 0;
	}

	$fileCount++;
	my($parFile) = $file;
	$parFile =~ s%.*/%%go;
	$name = $parFile;
	$name =~ s/\.par$//o;
	my($date) = $name;
	$date =~ s/^(....\...\...)-.*$/$1/o;
	my($par) = $name;
	$par =~ s/^....\...\...-//o;
	my($elapsedTime) = `./elapsedTime.pl $year/$month/$parFile`;
	if (defined($elapsedTime))
	{
		chomp $elapsedTime;
	}
	else
	{
		$elapsedTime = "";
	}
	if ("X$elapsedTime" ne "X")
	{
		$elapsedTime = "<br/>$elapsedTime";
	}
	print TMPINDEX << "__End";
<td align="center" valign="top"><a href="$name.jpg"><img width=256 height=192 src="$name.thumb.jpg"/><br/>
$date<br/>
$par</a><br/>
(<a href="$parFile">Parameter File</a>)$elapsedTime</td>
__End

	if ($fileCount % $numPerRow == 0)
	{
		print TMPINDEX << "__End";
</tr>
<tr>
__End
	}

	$lastMonth = $month;
	$lastYear = $year;
}

sub yearDirs()
{
	return sort { $b <=> $a } glob "[0-9][0-9][0-9][0-9]";
}

sub filesForYear($)
{
	my($year) = @_;
	return sort { $b cmp $a } glob "$year/??/*.par";
}

sub makePages()
{
	print "Making pages...\n";
	my($ydir);
	foreach $ydir (yearDirs())
	{
		print "$ydir...";
		my($file);
		my($lastMonth) = "";
		foreach $file (filesForYear($ydir))
		{
			my($month) = $file;
			$month =~ s%^[0-9][0-9][0-9][0-9]/([0-9][0-9])/.*%$1%;
			if ($month ne $lastMonth)
			{
				$lastMonth = $month;
				print " $month";
			}
			my($name) = $file;
			$name =~ s/\.par$//o;
			if (-f "$name.jpg")
			{
				processFile($file, $name);
			}
		}
		print "\n";
	}
	endPage;
}

sub getPageLinks($$)
{
	my($month, $year) = @_;
	my($nextMonth, $nextYear);
	if ($month == 12)
	{
		$nextYear = $year + 1;
		$nextMonth = "01";
	}
	else
	{
		$nextYear = $year;
		$nextMonth = sprintf("%02d", $month + 1);
	}
	my($nextDir) = "$nextYear/$nextMonth";
	my($nextPage) = "$nextDir/index.html";

	my($prevMonth, $prevYear);
	if ($month == "01")
	{
		$prevYear = $year - 1;
		$prevMonth = 12;
	}
	else
	{
		$prevYear = $year;
		$prevMonth = sprintf("%02d", $month - 1);
	}
	my($prevDir) = "$prevYear/$prevMonth";
	my($prevPage) = "$prevDir/index.html";

	my($prev);
	if (-e $prevPage || -e "$prevDir/tmp.html")
	{
		$prev = qq|<h1><a href="../../$prevPage">$prevYear.$prevMonth</a></h1>|;
	}
	else
	{
		$prev = "<h1>$prevYear.$prevMonth</h1>";
	}
	my($next);
	if (-e $nextPage || -e "$nextDir/tmp.html")
	{
		$next = qq|<h1><a href="../../$nextPage">$nextYear.$nextMonth</a></h1>|;
	}
	else
	{
		$next = "<h1>$nextYear.$nextMonth</h1>";
	}
	return qq|<tr><td colspan=4 align="center"><table width="100%"><tr><td>$prev</td><td align="center"><h1>$year.$month</h1></td><td align="right">$next</td></tr></table></td></tr>|;
}

sub insertPageLinks($$$)
{
	my($links, $source, $dest) = @_;
	open(SOURCE, "<$source") || die "open $source: $!";
	open(DEST, ">$dest") || die "open $dest: $!";
	local($_);
	while (<SOURCE>)
	{
		s/<!--PAGE_LINKS-->/$links/;
		print DEST $_;
	}
	close(DEST);
	close(SOURCE);
}

sub generateIndex()
{
	print "Making main index...\n";
	open(MAININDEX, ">tmp.html") || die "open tmp.html: $!";
	print MAININDEX << "__End";
<html><head><title>Jim Muth's Fractal of the Day</title>
<link rel="alternate" type="application/rss+xml"
title="Jim Muth's Fractal of the Day RSS Feed"
href="http://www.xmission.com/~legalize/fractals/fotd/fotd-rss.xml" />
</head>
<body><h1>Jim Muth's Fractal of the Day</h1>
<p><a href="about.html">About the Fractal of the Day</a></p>
<table><tr>
__End
	my($ycount) = 0;
	my($yearsPerRow) = 5;
	my($ydir);
	foreach $ydir (sort { $b <=> $a } glob "[0-9]???")
	{
		print MAININDEX qq|<td valign="top" align="center"><h2>$ydir</h2><ul>\n|;
		foreach my $page (sort { $b cmp $a } glob "$ydir/??/tmp.html")
		{
			my($year) = $page;
			$year =~ s/^([0-9][0-9][0-9][0-9]).*/$1/o;
			my($month) = $page;
			$month =~ s%^..../([0-9][0-9]).*%$1%o;
			my($links) = getPageLinks($month, $year);
			my($destPage) = "$year/$month/index.html";
			insertPageLinks($links, $page, $destPage);
			unlink($page);
			print MAININDEX qq|<li><a href="$destPage">$year.$month</a></li>\n|;
		}
		print MAININDEX "</ul></td>\n";
		$ycount++;
		if ($ycount == $yearsPerRow)
		{
			print MAININDEX "</tr><tr>\n";
			$ycount = 0;
		}
	}
	print MAININDEX "</tr></table></body></html>\n";
	close(MAININDEX);
	rename("tmp.html", "index.html");
}

sub main()
{
	moveFiles;
	makePages;
	generateIndex;
}

main
