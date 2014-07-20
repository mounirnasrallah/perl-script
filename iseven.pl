#!/usr/bin/perl

my $entier = shift; 

my $resultat = `./n_1 $entier`;

if($resultat =~ /^(.+)\1$/){
    1;
}
else{
    0;
}

