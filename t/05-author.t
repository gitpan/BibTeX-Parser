#!perl -T

use Test::More; 

use BibTeX::Parser::Author;

# Names from Mittelbach, Goossens: The LaTeX Companion, Second Edition.
my %names = (
	"Donald E. Knuth"   => ["Donald E.", undef, "Knuth", undef],
	"John Chris Smith"  => ["John Chris", undef, "Smith", undef],
	"Smith, John Chris" => ["John Chris", undef, "Smith", undef],
	"Thomas von Neumann"  => ["Thomas", "von", "Neumann", undef],
	"von Neumann, Thomas" => ["Thomas", "von", "Neumann", undef],
	"Lopez Fernandez, Miguel" => ["Miguel", undef, "Lopez Fernandez", undef],
	"Pierre de la Porte" => ["Pierre", "de la", "Porte", undef],
	"Smith, Jr., Robert" => ["Robert", undef, "Smith", "Jr."],
	"von Smith, Jr., Robert" => ["Robert", "von", "Smith", "Jr."],
	"Johannes Martinus Albertus van de Groene Heide" => ["Johannes Martinus Albertus", "van de", "Groene Heide", undef],
	"Maria-Victoria Delgrande" => ["Maria-Victoria", undef, "Delgrande", undef],
	"Anonymous" => [undef, undef, "Anonymous", undef],
	"von Neumann" => [undef, "von", "Neumann", undef],
	"N. Tetteh-Lartey" => ["N.", undef, "Tetteh-Lartey", undef],
	"von Tetteh-Lartey, N." => ["N.", "von", "Tetteh-Lartey", undef],
	"von Tetteh-Lartey, Jr.,  N." => ["N.", "von", "Tetteh-Lartey", "Jr."],
	""	=> [undef, undef, undef, undef],
	"   "	=> [undef, undef, undef, undef],
	"\n"	=> [undef, undef, undef, undef],
);

plan tests => (keys(%names) * 6 + 5);

my $author = new BibTeX::Parser::Author;

isa_ok($author, "BibTeX::Parser::Author", "Correct type");

is($author->first, undef, "Initial state 'first'");
is($author->von,   undef, "Initial state 'von'");
is($author->last,  undef, "Initial state 'last'");
is($author->jr,    undef, "Initial state 'jr'");


foreach my $name (keys %names) {

	is_deeply([BibTeX::Parser::Author->split($name)], $names{$name}, $name =~ /\w/  ? $name : "Whitespace" );

	$author = new BibTeX::Parser::Author $name;

	isa_ok($author, "BibTeX::Parser::Author");

	is($author->first, $names{$name}->[0] );
	is($author->von,   $names{$name}->[1]);
	is($author->last,  $names{$name}->[2]);
	is($author->jr,    $names{$name}->[3]);
}
