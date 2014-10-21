#!/usr/bin/perl

use strict;
use warnings;
use utf8;

use Test::More;
use BibTeX::Parser::Entry;

sub new_entry {
    BibTeX::Parser::Entry->new( 'ARTICLE', 'Foo2010', 1, { @_ } );
}

my @german_tests = (
    [ '"a' => 'ä' ],
    ['"`' => '„' ],
    ["\"'" => '“' ],
);

foreach my $test ( @german_tests ) {
    my $entry = new_entry( foo => $test->[0] );
    is( $entry->cleaned_field( 'foo', german => 1 ), $test->[1], "Convert $test->[0], german => 1" );
}

binmode( DATA, ':utf8' );
while (<DATA>) {
    chomp;
    my ( $tex, $result ) = split /\t/;
    is( new_entry( foo => $tex )->cleaned_field( 'foo' ), $result, "Convert $tex" );
}
close DATA;

done_testing;

__DATA__
\&	&
{\`a}	à
{\^a}	â
{\~a}	ã
{\'a}	á
{\'{a}}	á
{\"a}	ä
{\`A}	À
{\'A}	Á
{\"A}	Ä
{\aa}	å
{\AA}	Å
{\ae}	æ
{\bf 12}	12
{\'c}	ć
{\cal P}	P
{\c{c}}	ç
{\c{C}}	Ç
{\c{e}}	ȩ
{\c{s}}	ş
{\c{S}}	Ş
{\c{t}}	ţ
{\-d}	d
{\`e}	è
{\^e}	ê
{\'e}	é
{\"e}	ë
{\'E}	É
{\em bits}	bits
{\H{o}}	ő
{\`i}	ì
{\^i}	î
{\i}	ı
{\`i}	ì
{\'i}	í
{\"i}	ï
{\`\i}	ì
{\'\i}	í
{\"\i}	ï
{\`{\i}}	ì
{\'{\i}}	í
{\"{\i}}	ï
{\it Note}	Note
{\k{e}}	ę
{\l}	ł
{\-l}	l
{\log}	log
{\~n}	ñ
{\'n}	ń
{\^o}	ô
{\o}	ø
{\'o}	ó
{\"o}	ö
{\"{o}}	ö
{\'O}	Ó
{\"O}	Ö
{\"{O}}	Ö
{\rm always}	always
{\-s}	s
{\'s}	ś
{\sc JoiN}	JoiN
{\sl bit\/ \bf 7}	bit 7
{\sl L'Informatique Nouvelle}	L’Informatique Nouvelle
{\small and}	and
{\ss}	ß
{\TeX}	TEX
{\TM}	™
{\tt awk}	awk
{\^u}	û
{\'u}	ú
{\"u}	ü
{\"{u}}	ü
{\'U}	Ú
{\"U}	Ü
{\u{a}}	ă
{\u{g}}	ğ
{\v{c}}	č
{\v{C}}	Č
{\v{e}}	ě
{\v{n}}	ň
{\v{r}}	ř
{\v{s}}	š
{\v{S}}	Š
{\v{z}}	ž
{\v{Z}}	Ž
{\'y}	ý
{\.{z}}	ż
