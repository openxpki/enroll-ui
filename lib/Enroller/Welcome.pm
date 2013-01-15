package Enroller::Welcome;
use Mojo::Base 'Mojolicious::Controller';

# This action will render a template
sub welcome {
  my $self = shift;

  # Render template "welcome/welcome.html.ep" with message
  $self->render(
    message => 'Welcome to the Enrollment UI!');
}

1;
