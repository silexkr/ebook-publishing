use strict;
use warnings;
use ExtUtils::MakeMaker 6.30;

my %WriteMakefileArgs = (
    "ABSTRACT"           => "Utilities for publishing ebook",
    "AUTHOR"             => "Hyungsuk Hong <aanoaa\@gmail.com>",
    "BUILD_REQUIRES"     => { "Test::More" => 0 },
    "CONFIGURE_REQUIRES" => { "ExtUtils::MakeMaker" => "6.30" },
    "DISTNAME"           => "SILEX-ebook-tools",
    "LICENSE"            => "perl",
    "NAME"               => "SILEX-ebook-tools",
    "PREREQ_PM"          => {
        "Data::Section::Simple" => 0,
        "Text::Xslate"          => 0,
        "Cwd"                   => 0,
        "File::Slurp"           => 0,
    },
    "VERSION" => "0.0.1",
    "test"    => { "TESTS" => "t/*.t" }
);

unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
    my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
    my $pp = $WriteMakefileArgs{PREREQ_PM};
    for my $mod ( keys %$br ) {
        if ( exists $pp->{$mod} ) {
            $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
        }
        else {
            $pp->{$mod} = $br->{$mod};
        }
    }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
    unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);
