package CitationNeeded::Controller::Admin::Claims;

use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

=head1 NAME

CitationNeeded::Controller::Admin - admin area

=head1 DESCRIPTION

=head1 METHODS

=head2 index

Index page!1

=cut

sub index : Path('/admin/claims') {
    my ($self, $c) = @_;

    $c->stash->{claims} = [ $c->model('MongoDB')
        ->connection
        ->get_database('cn')
        ->get_collection('claims')
        ->find
        ->all ];

    $c->stash->{template} = 'admin/claims.tt';
}

1;
