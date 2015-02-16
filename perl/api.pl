#!/usr/bin/perl

use Mojolicious::Lite;
use DateTime;
use Mojo::JSON 'j';
use Try::Tiny;

@ARGV = qw(daemon --listen http://*:8080);

get '/' => { text => "Hello world!\n" };

get '/time' => sub {
    my $c   = shift;
    my $now = DateTime->now();
    $c->render( text => "$now\n" );
};

post '/sort' => sub {
    my $c    = shift;
    try {
        my $body = j($c->req->body);
        my @d = sort { $a <=> $b } @$body;
        $c->render( json => \@d);
    }
    catch {
        $c->render(text => '', status => 400 );
    }
};

app->start();
