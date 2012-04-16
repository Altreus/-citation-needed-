package CitationNeeded::Controller::Posts;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

=head1 NAME

CitationNeeded::Controller::Posts - Find posts

=head1 DESCRIPTION

=head1 METHODS

=head2 all

Show all posts

=cut

sub get :Private {
    my ( $self, $c ) = @_;

    my $posts = $c->model('MongoDB')->db->get_collection('posts')->find;

    return [$posts->all];
    return [
        {
            cite => {
                id => 1,
                name => 'Johnny',
            },
            claim => 'Jimmy is a doo-doo head',
            categories => [
                qw(Science)
            ],
        }
    ];
}

=head2 default

Standard 404 error page

=cut

sub default :Path {
    my ( $self, $c ) = @_;
    $c->response->body( 'Page not found' );
    $c->response->status(404);
}

=head2 end

Attempt to render a view, if needed.

=cut

sub end : ActionClass('RenderView') {}

=head1 AUTHOR

Alastair McGowan-Douglas,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
