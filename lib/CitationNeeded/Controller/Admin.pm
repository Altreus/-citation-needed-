package CitationNeeded::Controller::Admin;
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

sub index :Path('/admin') {
    my ($self, $c) = @_;

    $c->res->redirect('/admin/claims');
}

sub login :Local {
    my ($self, $c) = @_;

    my $param = $c->req->body_params;
    if (%$param) {
        $c->authenticate({ email => $param->{email},
                           password => $param->{password} })
            and return $c->res->redirect('/admin');
        $c->stash->{error_msg} = "Email or password incorrect";
    }
    $c->stash->{no_nav} = 1;
    $c->stash->{template} = 'admin/login.tt';
}

sub access_denied : Private {
    my ($self, $c, $action) = @_;

    $c->res->redirect('/admin/login');
}

sub end {
    my ($self, $c) = @_;

    $c->forward( $c->view('Admin') );
}

1;
