package CitationNeeded::MongoDB::User;

use Mongoose::Class;
use Authen::Passphrase;
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
    isa => 'Str',
    is => 'rw',
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

# Mongoose doesn't use new(), so can't coerce into a Passphrase.
sub check_password {
    my ($self, $pass) = @_;

    use Data::Dumper;

    my $ppr = index($self->password, '{') == 0
            ? Authen::Passphrase->from_rfc2307($self->password)
            : Authen::Passphrase->from_crypt($self->password);

    print Dumper [$ppr->match($pass)];
    return $ppr->match($pass);
}

__PACKAGE__->meta->make_immutable;
1;
