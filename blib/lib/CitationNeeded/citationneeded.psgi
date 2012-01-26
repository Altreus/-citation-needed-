use strict;
use warnings;

use CitationNeeded;

my $app = CitationNeeded->apply_default_middlewares(CitationNeeded->psgi_app);
$app;

