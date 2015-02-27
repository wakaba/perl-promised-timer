package Promised::Timer;
use strict;
use warnings;
our $VERSION = '1.0';
use AnyEvent;
use Promise;

sub timeout ($$) {
  my $t = $_[1];
  return Promise->new (sub {
    my $ok = $_[0];
    my $timer; $timer = AE::timer $t, 0, sub {
      $ok->();
      undef $timer;
    };
  });
} # timeout

1;

=head1 LICENSE

Copyright 2015 Wakaba <wakaba@suikawiki.org>.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
