package CitationNeeded::MongoDB::Claim;


use MongoDBx::Class::Moose; 
use namespace::autoclean;

with 'MongoDBx::Class::Document';

belongs_to user => (
    is => 'ro',
    isa => 'User',
);

no Moose;
__PACKAGE__->meta->make_immutable;
1;
