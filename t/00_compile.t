use strict;
use warnings;
use Test::More;

use_ok $_ for qw(
    Labo
    Labo::PC
    Labo::PC::Dispatcher
    Labo::PC::C::Root
    Labo::PC::C::Account
    Labo::PC::ViewFunctions
    Labo::PC::View
    Labo::Admin
    Labo::Admin::Dispatcher
    Labo::Admin::C::Root
    Labo::Admin::ViewFunctions
    Labo::Admin::View
);

done_testing;
