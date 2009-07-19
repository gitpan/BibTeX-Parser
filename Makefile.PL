
use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  DISTNAME  => 'BibTeX-Parser',
  NAME      => 'BibTeX::Parser',
  AUTHOR    => 'Gerhard\ Gossen\ \<gerhard\.gossen\@googlemail\.com\>',
  ABSTRACT  => 'A\ pure\ perl\ BibTeX\ parser',
  VERSION   => '0.3.1',
  EXE_FILES => [ qw() ],
  (eval { ExtUtils::MakeMaker->VERSION(6.31) } ? (LICENSE => 'perl') : ()),
  PREREQ_PM    => {
    "Test::More" => '0',
    "IO::File" => '0',
    "IO::String" => '0',
    "File::Spec" => '0',
    "Text::Balanced" => '0',
  },
);
