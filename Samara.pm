package Map::Tube::Samara;

# Pragmas.
use strict;
use warnings;
use 5.006;

# Modules.
use File::Share ':all';
use Moo;
use namespace::clean;

# Version.
our $VERSION = 0.02;

# Get XML.
has xml => (
	'is' => 'ro',
	'default' => sub {
		return dist_file('Map-Tube-Samara', 'samara-map.xml');
	},
);

with 'Map::Tube';

1;

__END__

=encoding utf8

=head1 NAME

Map::Tube::Samara - Interface to the Samara Metro Map.

=head1 SYNOPSIS

 use Map::Tube::Samara;
 my $obj = Map::Tube::Samara->new;
 my $routes_ar = $obj->get_all_routes($from, $to);
 my $lines_ar = $obj->get_lines;
 my $station = $obj->get_node_by_id($station_id);
 my $station = $obj->get_node_by_name($station_name);
 my $route = $obj->get_shortest_route($from, $to);
 my $stations_ar = $obj->get_stations($line);
 my $metro_name = $obj->name;
 my $xml_file = $obj->xml;

=head1 DESCRIPTION

It currently provides functionality to find the shortest route between the two
given nodes.

For more information about Samara Map, click L<here|https://en.wikipedia.org/wiki/Samara_Metro>.

=head1 METHODS

=over 8

=item C<new()>

 Constructor.

=item C<get_all_routes($from, $to)> [EXPERIMENTAL]

 Get all routes from station to station.
 Returns reference to array with Map::Tube::Route objects.

=item C<get_lines()>

 Get lines in metro map.
 Returns reference to array with Map::Tube::Line objects.

=item C<get_node_by_id($station_id)>

 Get station node by id.
 Returns Map::Tube::Node object.

=item C<get_node_by_name($station_name)>

 Get station node by name.
 Returns Map::Tube::Node object.

=item C<get_shortest_route($from, $to)>

 Get shortest route between $from and $to node names. Node names in $from and $to are case insensitive.
 Returns Map::Tube::Route object.

=item C<get_stations($line)>

 Get list of stations for concrete metro line.
 Returns reference to array with Map::Tube::Node objects.

=item C<name()>

 Get metro name.
 Returns string with metro name.

=item C<xml()>

 Get XML specification of Samara metro.
 Returns string with XML.

=back

=head1 EXAMPLE1

 # Pragmas.
 use strict;
 use warnings;

 # Modules.
 use Encode qw(decode_utf8 encode_utf8);
 use Map::Tube::Samara;

 # Object.
 my $obj = Map::Tube::Samara->new;

 # Get route.
 my $route = $obj->get_shortest_route(decode_utf8('Гагаринская'), decode_utf8('Безымянка'));

 # Print out type.
 print "Route: ".encode_utf8($route)."\n";

 # Output:
 # Route: Гагаринская (Первая линия), Спортивная (Первая линия), Советская (Первая линия), Победа (Первая линия), Безымянка (Первая линия)

=head1 EXAMPLE2

 # Pragmas.
 use strict;
 use utf8;
 use warnings;

 # Modules.
 use Map::Tube::Samara;

 # Object.
 my $obj = Map::Tube::Samara->new;

 # Get XML file.
 my $xml_file = $obj->xml;

 # Print out XML file.
 print "XML file: $xml_file\n";

 # Output like:
 # XML file: .*/samara-map.xml

=head1 DEPENDENCIES

L<File::Share>,
L<Map::Tube>,
L<Moo>,
L<namespace::clean>.

=head1 SEE ALSO

L<Map::Tube>,
L<Map::Tube::Barcelona>,
L<Map::Tube::Berlin>,
L<Map::Tube::Delhi>,
L<Map::Tube::London>,
L<Map::Tube::Kiev>,
L<Map::Tube::Minsk>,
L<Map::Tube::Moscow>,
L<Map::Tube::NYC>,
L<Map::Tube::Prague>,
L<Map::Tube::Sofia>,
L<Map::Tube::Tokyo>,
L<Map::Tube::Warsaw>.

=head1 REPOSITORY

L<https://github.com/tupinek/Map-Tube-Samara>

=head1 AUTHOR

Michal Špaček L<mailto:skim@cpan.org>

L<http://skim.cz>

=head1 LICENSE AND COPYRIGHT

 © 2014-2015 Michal Špaček
 Artistic License
 BSD 2-Clause License

=head1 VERSION

0.02

=cut
