#!/usr/bin/perl 

$nombre = shift;

my $i = 0;
my $affiche = "";

while($i<$nombre){
    $affiche = $affiche."1";
    $i++;
}

print STDOUT $affiche;
