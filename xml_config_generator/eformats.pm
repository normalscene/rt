package eformats;

use strict;
use warnings;

our $formats = 
{
  null_format => 
  {
    align => 'right',
    valign => undef, 
    #border => undef,
    color => '#ffffff',
    #color => 'black',
    bg_color => '#ff8d00',
    font => 'Calibri',
    size => 11,
  },
  normal_format =>
  {
    align => 'right',
    valign => undef, 
    #border => undef,
    color => 'black',
    bg_color => '#dbeb6a',
    font => 'Calibri',
    size => 11,
  },
  zero_format => 
  {
    align => 'left',
    valign => undef, 
    #border => undef,
    color => 'white',
    bg_color => 'navy',
    font => 'Calibri',
    size => 11,
  },
  red_num_format => 
  {
    align => 'left',
    valign => undef, 
    #border => undef,
    color => 'white',
    bg_color => 'navy',
    font => 'Calibri',
    size => 11,
  },
  green_num_format => 
  {
    align => 'left',
    valign => undef, 
    #border => undef,
    color => 'white',
    bg_color => 'navy',
    font => 'Calibri',
    size => 11,
  },
};

1;
