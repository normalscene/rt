package comp;

use strict;

sub new 
{
  my ( $class,$data,$src,$tgt )  = @_;

  my $self = {};
  bless ($self,$class);
  return comp ($data,$src,$tgt);
}

sub comp 
{
  my $result;
  #my ($data,$src,$tgt) = @_;
  my ($options) = @_;

  my ($data,$src,$tgt,$mode);
  $data = $options->{data};
  $src = $options->{src};
  $tgt = $options->{tgt};
  $mode = $options->{mode}; 

  foreach my $key (keys %{$data->{$src}}) {
    next if ($data->{$src}{$key} eq $data->{$tgt}{$key});
    if (!exists $data->{$tgt}{$key}) {
      push (@{$result->{mt}}, [
          split(/,/,$key),
          split(/,/,$data->{$src}{$key}),
          'NULL', 
        ]);
    }
    if (exists $data->{$tgt}{$key}) {
      push (@{$result->{diff}}, [
          split(/,/,$key),
          split(/,/,$data->{$src}{$key}),
          split(/,/,$data->{$tgt}{$key}),
        ]);
    }
  }

  foreach my $key (keys %{$data->{$tgt}}) {
    next if ($data->{$src}{$key} eq $data->{$tgt}{$key});
    if (!exists $data->{$src}{$key}) {
      push (@{$result->{ms}}, [
          split(/,/,$key),
          'NULL',
          split(/,/,$data->{$tgt}{$key}),
        ]);
    }
  }

  return $result;
}

1;
