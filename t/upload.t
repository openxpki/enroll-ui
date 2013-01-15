use Mojo::Base -strict;

use Test::More;
use Test::Mojo;

use FindBin;

my $fh;

my $csr1filename = "$FindBin::Bin/test-1.csr";

if ( not open($fh, "<$csr1filename") ) {
    die "Error opening $csr1filename: $!";
}
my $csr1 = join('', <$fh>);
close $fh;

my $t = Test::Mojo->new('Enroller');

# Allow 302 redirect responses
$t->ua->max_redirects(1);

$t->get_ok('/')->status_is(200)
    ->content_like(qr/Upload CSR/i)
    ->element_exists('form input[name="csr"]')
    ->element_exists('form input[type="submit"]')
    ;

$t->post_form_ok(
    '/upload', 
    { csr => {file => $csr1filename}}, 
)->status_is(200)
    ->content_like(qr/The CSR has been received/)
    ;

done_testing();
