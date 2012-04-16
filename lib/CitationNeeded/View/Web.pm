package CitationNeeded::View::Web;

use strict;
use warnings;

use base 'Catalyst::View::TT';

__PACKAGE__->config(
    TEMPLATE_EXTENSION => '.tt',
    WRAPPER => 'main/layout.tt',
    render_die => 1,
);

=head1 NAME

CitationNeeded::View::Web - TT View for CitationNeeded

=head1 DESCRIPTION

TT View for CitationNeeded.

=head1 SEE ALSO

L<CitationNeeded>

=head1 AUTHOR

Alastair McGowan-Douglas,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
