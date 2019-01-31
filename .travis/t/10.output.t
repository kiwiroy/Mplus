# -*- mode: perl; -*-
use Mojo::Base -base;
use Mojo::Collection 'c';
use Mojo::Home;
use Test::More;

sub ideal_file_ok {
    my ($header, $table) = @_;
    is_deeply $header, ['Ideal core'], 'ideal only';
    is_deeply parse_member_string($table->first->first), [
        qw{4 popK 8 7 15 5 23 24 10 28 1 21 17 20 11 2 12}
    ], 'ideal core';
}

sub output_file_ok {
    my ($file)  = shift;
    my $content = c(split /\n/, $file->slurp);
    my $table   = $content->map(sub { c(split /\t/) });
    my $header  = shift @$table;

    if ($file =~ m/ideal/) {
        ideal_file_ok( $header, $table );
    } else {
        table_file_ok( $header, $table );
    }
}

sub parse_member_string {
    (my $members = $_[0]) =~ s/[\(\)]//g;
    return [ split /,/, $members ];    
}

sub table_file_ok {
    my ($header, $table) = @_;
    is_deeply $header, [ 
        'core size',
        'random reference diversity',
        'optimized reference diversity',
        'random target diversity',
        'optimized target diversity',
        'alt random reference diversity',
        'alt optimized reference diversity',
        'alt random target diversity',
        'alt optimized target diversity',
        'core members'
    ], 'header columns correct';
    cmp_ok $table->size, '>', 1, 'table has realistic size';
    $table->each(
        sub {
            my ($core, $entries) = @$_[0,9];
            my $members = parse_member_string($entries);
            like $core, qr/^[0-9]+$/, 'is integer';
            is @$members, $core, 'match';
        });
}

Mojo::Home->new
    ->detect
    ->dirname
    ->child('eg.out')
    ->list
    ->grep(qr/\.out$/)
    ->tap(sub { is $_->size, 5, 'correct number of files' })
    ->each(\&output_file_ok);



done_testing;
