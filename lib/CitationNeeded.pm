package CitationNeeded;
use Moose;
use namespace::autoclean;

use Catalyst::Runtime 5.80;

# Set flags and add plugins for the application.
#
# Note that ORDERING IS IMPORTANT here as plugins are initialized in order,
# therefore you almost certainly want to keep ConfigLoader at the head of the
# list if you're using it.
#
#         -Debug: activates the debug mode for very useful log messages
#   ConfigLoader: will load the configuration from a Config::General file in the
#                 application's home directory
# Static::Simple: will serve static files from the application's root
#                 directory

use Catalyst qw/
    -Debug
    ConfigLoader
    Static::Simple
    Session
    Session::State::Cookie
    Session::Store::FastMmap
    Authentication
    Authorization::Roles
    Authorization::ACL
/;

extends 'Catalyst';

our $VERSION = '0.01';

__PACKAGE__->config(
    name => 'CitationNeeded',
    # Disable deprecated behavior needed by old applications
    disable_component_resolution_regex_fallback => 1,
    enable_catalyst_header => 1, # Send X-Catalyst header
);

# Start the application
__PACKAGE__->setup();

__PACKAGE__->deny_access_unless(
    '/admin' => [qw/ admin /]
);

__PACKAGE__->allow_access(
    '/admin/login'
);
=head1 NAME

CitationNeeded - Catalyst based application

=head1 SYNOPSIS

    script/citationneeded_server.pl

=head1 DESCRIPTION

[enter your description here]

=head1 SEE ALSO

L<CitationNeeded::Controller::Root>, L<Catalyst>

=head1 AUTHOR

Alastair McGowan-Douglas,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
