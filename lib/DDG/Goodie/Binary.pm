package DDG::Goodie::Binary;

use DDG::Goodie;

zci is_cached => 1;

triggers end => "binary";

sub bin {
    my @tex = shift;
    my $bin;
    for(my $x = 0; $x <= $#tex; $x++) {
        $bin .= unpack("B*", $tex[$x]);
    }
    return $bin;
}


handle remainder => sub {
    return bin($1) if /^(.*)\s+(in|to)$/;
    return;
}
