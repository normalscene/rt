#!/usr/bin/env perl

use strict;
use warnings;
use Data::Dumper;
use XML::Simple qw(XMLout);

my ($src_file, $tgt_file) = @ARGV;
die "Need source and target file names!\n" if scalar @ARGV != 2;

my $config = 
{
  $src_file => 
  {
    keys => [0,1,2],
    values => [3,4,5],
  },
  $tgt_file => 
  {
    keys => [0,1,2],
    values => [3,4,5],
  },
};

print XMLout (
  $config, 
  RootName => 'recon_config',
); 
