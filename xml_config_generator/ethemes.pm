package ethemes;

use strict;
use warnings;
use eformats;

our $themes = 
{
  theme_1 => 
  {
    data_format => $eformats::formats->{normal_format},
    merge_format =>
    [ 
      {
        align => 'left',
        valign => 'vcenter',
        border => undef,
        color => 'white', 
        bg_color => 'red',
        font => 'Calibri',
        size => 14,
        bold => 1,
      },
      {
        align => 'left',
        valign => 'vcenter',
        border => undef,
        color => 'white',
        bg_color => 'navy',
        font => 'Calibri',
        size => 14,
        bold => 1,
      },
    ],
    header_format => 
    [
      {
        align => 'center',
        valign => 'vcenter',
        border => undef,
        color => 'white',
        bg_color => 'green',
        font => 'Arial',
        size => 12,
      },
    ],
  },
  theme_2 => 
  {
    data_format => $eformats::formats->{normal_format},
    merge_format => 
    [
      {
        align => 'left',
        valign => 'vcenter',
        border => undef,
        color => 'white', 
        bg_color => 'navy',
        font => 'Calibri',
        size => 14,
        bold => 1,
      },
      {
        align => 'left',
        valign => 'vcenter',
        border => undef,
        color => 'white',
        bg_color => 'red',
        font => 'Calibri',
        size => 14,
        bold => 1,
      },
    ],
    header_format => 
    [
      {
        align => 'center',
        valign => 'vcenter',
        border => undef,
        color => 'white',
        bg_color => '#4e376b',
        font => 'Arial',
        size => 12,
      },
    ],
  },
  theme_3 => 
  {
    data_format => $eformats::formats->{normal_format},
    merge_format =>
    [ 
      {
        align => 'left',
        valign => 'vcenter',
        border => undef,
        color => 'white', 
        bg_color => 'red',
        font => 'Calibri',
        size => 14,
        bold => 1,
      },
      {
        align => 'left',
        valign => 'vcenter',
        border => undef,
        color => 'white',
        bg_color => 'navy',
        font => 'Calibri',
        size => 14,
        bold => 1,
      },
    ],
    header_format => 
    [
      {
        align => 'center',
        valign => 'vcenter',
        border => undef,
        color => 'white',
        bg_color => '#01015e',
        font => 'Arial',
        size => 12,
      },
    ],
  },
};

1;
