#!/usr/local/bin/perl -w

use strict;

sub fileModificationTime($)
{
	my($path) = @_;
	return (stat($path))[9];
}

sub separator($)
{
	my($text) = @_;
	if (length($text) > 0)
	{
		return ", ";
	}
	return "";
}

sub plural($)
{
	my($number) = @_;
	if ($number > 1)
	{
		return "s";
	}
	return "";
}

sub accumulateInterval($$$)
{
	my($text, $label, $value) = @_;
	if ($value > 0)
	{
		$text .= sprintf("%s%d %s%s",
			separator($text), $value, $label, plural($value));
	}
	return $text;
}

sub portion($$)
{
	my($amount, $factor) = @_;
	my($whole) = int($amount/$factor);
	my($fraction) = $amount - $whole*$factor;
	return ($whole, $fraction);
}

sub elapsedTime($)
{
	my($seconds) = @_;
	my($minutes, $hours, $days);
	($minutes, $seconds) = portion($seconds, 60);
	($hours, $minutes) = portion($minutes, 60);
	($days, $hours) = portion($hours, 24);
	my($text) = accumulateInterval("", "day", $days);
	$text = accumulateInterval($text, "hour", $hours);
	$text = accumulateInterval($text, "minute", $minutes);
	return accumulateInterval($text, "second", $seconds);
}

sub main($)
{
	my($parFile) = @_;
	my($jpgFile) = $parFile;
	$jpgFile =~ s/\.par$/.jpg/;

	my($parFileTime) = fileModificationTime($parFile);
	my($jpgFileTime) = fileModificationTime($jpgFile);
	my($elapsed) = $jpgFileTime - $parFileTime;
	if ($elapsed > 0)
	{
		printf("%s\n", elapsedTime($elapsed));
	}
}

main($ARGV[0]);
