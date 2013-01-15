package Enroller;
use Mojo::Base 'Mojolicious';

# This method will run once at server start
sub startup {
  my $self = shift;

  # Documentation browser under "/perldoc"
  #$self->plugin('PODRenderer');

  # Router
  my $r = $self->routes;

  # Normal route to controller
  $r->get('/')->to(controller => 'welcome', action => 'welcome')->name('index');

  # Upload
  $r->post('/upload')->to(controller => 'upload', action => 'upload')->name('upload');

  # Upload OK
  #$r->get('/upload')->to(controller => 'upload', action => 'upload_ok')->name('upload_ok');

}

1;
