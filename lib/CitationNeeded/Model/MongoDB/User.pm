package CitationNeeded::Model::MongoDB::User;

use MongoDBx::Class::Moose; 
use MooseX::Types::Authen::Passphrase qw(Passphrase);
use namespace::autoclean;

extends 'Catalyst::Authentication::User';

with 'MongoDBx::Class::Document';

use List::MoreUtils qw(all);

has roles => (
    isa => 'Maybe[ArrayRef[Str]]',
    is => 'ro',
);

has password => (
    isa => Passphrase,
    is => 'rw',
    coerce => 1,
    handles => { check_password => 'match' },
);

has_many claims => (
    isa => 'Claim',
    is => 'ro',
);

no Moose;

my %catalyst_supports = (
    session => 1,
    roles => 1,
);
sub supports {
    shift;
    return all {exists $catalyst_supports{$_}} @_;
}

__PACKAGE__->meta->make_immutable;
1;
