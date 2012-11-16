package CitationNeeded::MongoDB;
use Moose;
use Mongoose;

Mongoose->load_schema(search_path => __PACKAGE__);
Mongoose->naming('plural');

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

    # This is a bit backwards because we discard the MongoDB::Database and store
    # a MongoDB::Connection, only to later use that connection to get the DB.
    # I'm pretty sure this is because I can use the same Connection to get other
    # DBs but if it turns out I can't then I can switch this around later.
    my $db = delete $args->{db};
    Mongoose->db($db);

    my $conn = MongoDB::Connection->new($args ? %$args : ());

    return $class->$orig(connection => $conn, _dbname => $db);
};

sub db {
    my $self = shift;

    return $self->connection->get_database($self->_dbname);
}

sub document {
    return __PACKAGE__ . '::' . $_[1];
}

1;
