package econf;

use strict;
use warnings;

our $conf = 
{
  ms => 
  {
    theme => 'theme_1',
    row_freeze => 2,
    col_freeze => 2,
    tab_data => undef,
    tab_data_row_start_num => 2,
    tab_color => 'red', 
    headers => 
    [
      {
        autofilter => 1,
        row_number => 1,
        fields => 
        [
          qw (country item_no item weight(kg) color shape price status)
        ],
      },
    ],
    has_merged_headers => 
    [
      { 
        row_size => undef,
        merge_range_size => 'A1:B1',
        merge_range_text => 'comp keys', 
      },
      {
        row_size => undef, 
        merge_range_size => 'C1:H1',
        merge_range_text => 'Current situation', 
      }
    ],
  },
  mt => 
  {
    theme => 'theme_2',
    override => 
    { 
      data_cell_bg_color => '#cdfcc1' 
    },
    row_freeze => 2,
    col_freeze => 2,
    tab_data => undef,
    tab_data_row_start_num => 2,
    tab_color => 'blue',
    headers => 
    [
      {
        autofilter => 1,
        row_number => 1,
        fields => 
        [
          qw (country item_no item weight(kg) color shape price status)
        ],
      },
    ],
    has_merged_headers => 
    [
      { 
        row_size => undef, 
        merge_range_size => 'A1:B1',
        merge_range_text => 'comp keys', 
      },
      {
        row_size => undef, 
        merge_range_size => 'C1:H1',
        merge_range_text => 'Current situation', 
      }
    ],
  },
  diff => 
  {
    theme => 'theme_1',
    row_freeze => 2,
    col_freeze => 2,
    tab_data => undef,
    tab_data_row_start_num => 2,
    tab_color => 'red', 
    headers => 
    [
      {
        autofilter => 1,
        row_number => 1,
        fields => 
        [
          qw (country item_no item weight(kg) color shape price status)
        ],
      },
    ],
    has_merged_headers => 
    [
      { 
        row_size => undef,
        merge_range_size => 'A1:B1',
        merge_range_text => 'comp keys', 
      },
      {
        row_size => undef, 
        merge_range_size => 'C1:H1',
        merge_range_text => 'Current situation', 
      }
    ],
  },
};

1;
