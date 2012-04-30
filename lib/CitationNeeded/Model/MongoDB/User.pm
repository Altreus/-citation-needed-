package CitationNeeded::Model::MongoDB::User;

use base 'Catalyst::Authentication::User';

sub roles {
    return shift->{roles};
}

1;
