package Enroller::Upload;
use Mojo::Base 'Mojolicious::Controller';
use Data::Dumper;

# This action will render a template
sub upload {
  my $self = shift;

  # Uploaded image(Mojo::Upload object)
  my $data = $self->req->upload('csr');

  # Nothing uploaded
  unless ($data) {
      return $self->render(
          template => 'error',
          message => 'Upload failed. No data was specified'
      );
  }

  # Max size for upload
  my $upload_max_size = 3 * 1024;

  # Exceed max size
  if ( $data->size > $upload_max_size ) {
      return $self->render(
          template => 'error',
          message => 'Upload failed. Data is too large.'
      );
  }

  # Check file type
  my $data_type = $data->headers->content_type;

  my %valid_types = map {$_ => 1} qw( application/octet-stream );

  # Content type is wrong
#  unless ($valid_types{$data_type}) {
#      return $self->render(
#          template => 'error',
#          message => "Upload failed. Content type ($data_type) is incorrect."
#      );
#  }

  $self->render(
      message => 'The CSR has been received'
  );

}


1;
