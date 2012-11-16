package CitationNeeded::MongoDB::User;

use Mongoose::Class;
use MooseX::Types::Authen::Passphrase qw(Passphrase);
use namespace::autoclean;

extends 'Catalyst::Authentication::User';

with 'Mongoose::Document' => {
    -collection_name => 'users'
};

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

has name => (
    isa => 'Str',
    is => 'ro',
);

has email => (
    isa => 'Str',  # TODO: Email type
    is => 'rw',
);

has screen_name => (
    isa => 'Str',
    is => 'rw',
);

has_many claims => 'Claim';

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
