#!/usr/bin/perl -wnl

$_ =~ /^(\w+) (\d+) ([\d]{1,2}:[\d]{1,2}:[\d]{1,2}) (.*)/;
my $fr = `date --date="$1 $2 $3"`;
chomp $fr;
print "$fr $4";
