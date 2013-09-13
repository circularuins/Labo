package Labo::PC::C::Root;
use strict;
use warnings;
use utf8;

sub index {
    my ($class, $c) = @_;
    my @entries = $c->db->search(entry => {}, {order_by => {'ctime' => 'DESC'}});
    $c->render('index.tt', { entries => \@entries});
}

1;
