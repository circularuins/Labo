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

    my $url = '/entry/show?id=' . $id->{row_data}->{id};
    return $c->redirect($url);
}

sub update {
    my ( $class, $c ) = @_;
    my $id = $c->request->param('id');
    if ( my $body = $c->request->param('body') ) {
#        $body =~ s%<br />%&lt;br /&gt;%g;
#        $body =~ s%\r\n%<br />%g;
        my $now = time;
        if ( my $title = $c->request->param('title') ) {
            $c->db->update(
                'entry' => {
                    title => $title,
                    body  => $body,
                    utime => $now,
                },
                {
                    id => $id,
                }
            );
        }
        else {
            $c->db->update(
                'entry' => {
                    title => '無題',
                    body  => $body,
                    utime => $now,
                },
                {
                    id => $id,
                }
            );
        }
    }

    my $url = '/entry/show?id=' . $id;
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

sub js_eval {
    my ($class, $c) = @_;
    my $query = $c->{request}->{env}->{QUERY_STRING};
    my ($id) = $query =~ /id=(\d+)/;
    my @entries = $c->db->search('entry', {'id' => $id});

    $c->render('js_eval.tt', { entries => \@entries });
}

1;
