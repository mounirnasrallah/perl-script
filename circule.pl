#!/usr/bin/perl

$mot = shift;
$mot =~ s/^(\w)(\w*)$/\2\1/;
print STDOUT $mot;
