#!/usr/bin/perl -w

use strict;
use warnings;
use diagnostics;
diagnostics::enable;
use IO::Socket;

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
	    print $client "OK"
	}
	else{
	    print $client "BAD_USER";
	}	
    }
}

