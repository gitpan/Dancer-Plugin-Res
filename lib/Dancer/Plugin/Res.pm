package Dancer::Plugin::Res;

our $VERSION = '0.0001'; # VERSION

use Dancer ':syntax';
use Dancer::Plugin;

register res => sub {
    my ($status, $body) = @_;
    status $status;
    return $body;
};

register_plugin;

# ABSTRACT: Syntax sugar for setting the status and returning a response


1;

__END__
=pod

=head1 NAME

Dancer::Plugin::Res - Syntax sugar for setting the status and returning a response

=head1 VERSION

version 0.0001

=head1 SYNOPSIS

    use Dancer;
    use Dancer::Plugin::Res;
    post '/widgets' => sub {
        return res 400 => 'Sorry, name param is required'
            unless param 'name';
    };
    dance;

=head1 DESCRIPTION

This L<Dancer> plugin provides the keyword C<res()>, which stand for response.
Calling C<return res 400, 'reason'> in a route is equivalent to:

    status 400;
    return 'reason';

=head1 AUTHOR

Naveed Massjouni <naveedm9@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Naveed Massjouni.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

