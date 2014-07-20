#!/usr/bin/perl -wn

BEGIN{
my %results;
}

/^(\w+) (\d+) ([\d]{1,2}:[\d]{1,2}:[\d]{1,2}) ([\w\d-]+) ([\w\d-]+)(\[(\d*)\])?: (.*)/;
$results{$5} = 0;
  
END{
    foreach $key (sort { "\L$a" cmp "\L$b" } (keys %results)){
	print $key." ";
    }   
}
