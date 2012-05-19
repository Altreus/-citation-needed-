package CitationNeeded::Model::MongoDB::User;

use base 'Catalyst::Authentication::User';
use List::MoreUtils qw(all);

sub roles {
    my $self = shift;
    print "Roles: @{$self->{roles}}";
    return @{$self->{roles}};
}

sub check_password { 1 }

my %catalyst_supports = (
    session => 1,
    roles => 1,
);
sub supports {
    shift;
    return all {exists $catalyst_supports{$_}} @_;
}
1;
