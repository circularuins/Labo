package Labo::PC::C::Entry;
use strict;
use warnings;
use utf8;
use Time::Local 'timelocal';
use Data::Dumper;

sub create {
    my ( $class, $c ) = @_;
    my $id;
    if ( my $body = $c->request->param('content') ) {
#        $body =~ s%<br />%&lt;br /&gt;%g;
#        $body =~ s%\r\n%<br />%g;
        if ( my $title = $c->request->param('title') ) {
            $id = $c->db->insert(
                'entry' => {
                    title       => $title,
                    body        => $body,
                }
            );
        }
        else {
            $c->db->insert(
                'entry' => {
                    title       => '無題',
                    body        => $body,
                }
            );
        }
    }

print Dumper $id;
    my $url = '/entry/show?id=' . $id->{row_data}->{id};
    return $c->redirect($url);
}

sub show {
    my ($class, $c) = @_;
    my $query = $c->{request}->{env}->{QUERY_STRING};
    my ($id) = $query =~ /id=(\d+)/;
    my @entries = $c->db->search('entry', {'id' => $id});

    return $c->render('entry.tt', {
        entries => \@entries,
    });
}
1;
