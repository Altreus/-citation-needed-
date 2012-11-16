package CitationNeeded::MongoDB::Claim;

use Mongoose::Class;
use namespace::autoclean;

with 'Mongoose::Document';

belongs_to user => 'User';

no Moose;
__PACKAGE__->meta->make_immutable;
1;
