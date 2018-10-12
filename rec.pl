#!/usr/bin/env perl

use lib "$ENV{PWD}/lib";

use EW3;
use comp;
use strict;
use warnings;
use Data::Dumper;
use XML::Simple qw(XMLin);

my $h; 
my ($srcfile,$tgtfile) = @ARGV;

# xml configs
my $config = XMLin(
  'config/sca.xml', 
  ForceArray => [
    'keys',
    'values',
    'headers',
    'header_format',
  ],
); 

# read and hash
for my $file ($srcfile, $tgtfile) 
{
  my $filename = $file;
  $filename =~ s@data/@@g;

  open (FH, "<$file") || die "Couldn't open file ($file)\n";
  while (my $line = <FH>) { 
    chomp $line;
    my $k = join (',',(split /,/, $line)[@{$config->{recon_config}{$filename}{keys}}]);
    my $v = join (',',(split /,/, $line)[@{$config->{recon_config}{$filename}{values}}]);
    $h->{$file}{$k} = $v;
  } 

  close (FH) or warn "Had problems closing file ($file)\n";
}

# get comp result
my $result = comp->new({
    data => $h,
    src => $srcfile,
    tgt => $tgtfile,
    mode => undef,
  });

# generate excel
my $excel = EW3->generate_excel_file(
  'test.xlsx',
  $result,
  $config,
);
