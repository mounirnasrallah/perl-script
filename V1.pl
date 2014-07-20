#!/usr/bin/perl -w

use strict;
use warnings;
use diagnostics;
diagnostics::enable;
use IO::Socket;

my %parties;

my %users;

my $port = shift;

my $server = IO::Socket::INET -> new (Proto => "tcp",
				      LocalPort => $port,
				      Listen => SOMAXCONN,
				      Reuse => 1);

die "Ne peux pas créer de Socket sur le port $port: $!" unless $server;

print "Le serveur est en marche...";

$SIG{"CHLD"}="IGNORE";

while (my $client = $server->accept()) {
    print "Le serveur accepte une connexion";
    my $pid = fork();
    if (!defined $pid) {
	print "Il y a une erreur dans le fork";
    }
    elsif ($pid) {
	
    }
    else {
	$client -> autoflush(1);

	print $client "USER";
	
	my $user = <$client>;
	
	if(undef($users{$user})){
	    $users{$user} = 1;
	    print $client "OK";
	
	    my $commande = <$client>;
	    
	    if($commande =~ /QUIT/){
		print $client "Au revoir !";
		$client -> shutdown(2);
		exit;
	    }

	    if($commande =~ /CREATE (\w+) (\d+)/){
		$parties{$1} = $2;
	    }
	    if($commande =~ /JOIN/){
	    }
	    if($commande =~ /LIST/){
		foreach my $k (keys %parties){
		    print "$k $parties{$k}";
		}
            }

	}
	else{
	    print $client "BAD_USER";
	}	


	

    }
}

