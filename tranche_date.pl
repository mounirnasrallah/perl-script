#!/usr/bin/perl -l

use strict;
use warnings;
use diagnostics;
diagnostics::enable;
use Time::Local qw/localtime/;

my $debut = shift;
$debut = &localtime($debut);
my $fin = shift;
$fin = &localtime($fin);

my $fichier = shift;

open $fh, "$fichier" or die "Erreur";

while($ligne = <$fh>){
    if(/^(\w+ \d+ \w+ \d+)*/){
	$tmp = &localtime($1);
	if($debut<$tmp && $tmp>$fin){
	    print $_;
	}
    }
}

close $fh;
