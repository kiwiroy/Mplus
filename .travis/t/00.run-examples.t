# -*- mode: perl; -*-
use Mojo::Base -strict;
use Mojo::Home;
use Test::More;
use Capture::Tiny qw{capture};

sub run_example_ok {
    my ($script) = shift;
    my ($out, $err, $xit) = capture {
        system { $script } $script;
    };
    is $xit, 0, 'success';
    like $out, qr/elapsed time/i, 'reporting elapsed time ok';
    like $out, qr/complete/, 'completed';
}

Mojo::Home->new
    ->detect
    ->dirname
    ->child('eg')
    ->list
    ->grep(qr/\.sh$/)
    ->tap(sub { is $_->size, 5, 'correct number of files' })
    ->each(\&run_example_ok);

done_testing;
