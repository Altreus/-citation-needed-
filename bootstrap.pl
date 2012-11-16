#!/usr/bin/perl

use lib 'lib';
use CitationNeeded;
use Authen::Passphrase::Clear;

my $c = CitationNeeded->new;

my ($user, $pass) = @ARGV or die "YOU FORGOT THE PARAMETERS YOU ARSE";

$c->model('MongoDB')->document('User')
    ->new({
        email => $user,
        password => $pass,
    })
    ->save();
