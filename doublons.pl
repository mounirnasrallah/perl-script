#!/usr/bin/perl -w

my $dir=shift;
my %resultat;

opendir my $directory, $dir or die "Probleme de repertoire de la bdd : $!";
my @files = readdir $directory;

foreach (@files){
    if(-f $dir.'/'.$_){
	my $md = `md5sum $dir/$_`; 
	if(undef($resultat{$md})){
	    $resultat{$md}=$_;
	}
	else{
	    print $_." ";
	}
    }
}

close $directory;
