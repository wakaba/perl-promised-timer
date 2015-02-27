use strict;
use warnings;
use Path::Tiny;
use lib glob path (__FILE__)->parent->parent->child ('t_deps/modules/*/lib');
use Promised::Timer;
use Test::More;
use Test::X1;
use Time::HiRes qw(time);

test {
  my $c = shift;
  my $t1 = time;
  Promised::Timer->timeout (0.3)->then (sub {
    my $result = $_[0];
    test {
      my $t = time - $t1;
      ok $t > 0;
      ok $t < 1;
      is $result, undef;
      done $c;
      undef $c;
    } $c;
  });
} n => 3;

run_tests;

=head1 LICENSE

Copyright 2015 Wakaba <wakaba@suikawiki.org>.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
