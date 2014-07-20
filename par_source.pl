#!/usr/bin/perl -w

my $fichier = shift;

$tmp = `./les_sources $fichier`;

@noms = split /\ /,$tmp;

foreach $nom (@noms){
    open $file, ">","$nom" or die "Error";
    select $file;
    @lignes = `grep "$nom" $fichier`;
    print @lignes;
    close $file;
}
