package CitationNeeded::MongoDB;
use Moose;
<<<<<<< HEAD
use MongoDB;
=======
use MongoDBx::Class;
>>>>>>> 58a2005... Fix Mongo model thanks to Khisanth

has connection => (
    is => 'ro',
    isa => 'MongoDB::Connection',
    handles => [qw(database_names send recv)],
);

has _dbname => (
    is => 'rw',
    isa => 'Str',
);

around BUILDARGS => sub {
    my $orig = shift;
    my $class = shift;
    my $args = shift;

    my $db = delete $args->{db};

    my $conn = MongoDB::Connection->new($args ? %$args : ());

    return $class->$orig(connection => $conn, _dbname => $db);
};

sub db {
    my $self = shift;

    return $self->connection->get_database($self->_dbname);
}

1;
