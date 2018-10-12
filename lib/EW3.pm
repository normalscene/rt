package EW3;

use strict;
use warnings;
use Data::Dumper;
use Excel::Writer::XLSX;
use List::Util qw(shuffle);

#####################
sub generate_excel_file 
{
  return undef if scalar @_ != 4;
  my ($class,$excel_name,$data,$config) = @_;

  my $self = {};
  bless ($self,$class);

  # handle extension. null or xls TO xlsx. 
  $excel_name =~ s/^(.+?)xls$/${1}xlsx/g 
    if ($excel_name =~ /^.+?xls$/);
  $excel_name = $excel_name.'.xlsx' 
    if ($excel_name !~ /\.xlsx$/);

  $self->{name} = $excel_name;
  $self->{conf} = $config;
  $self->{worktab} = undef;
  $self->{workbook} = Excel::Writer::XLSX->new($excel_name); 

  # get current workbook to work upon.
  my $wb = $self->workbook();

  # set workbook properties
  # title, comment ..etc.
  if ($config->{exprops})
  {
    $wb->set_properties(%{$config->{exprops}});
  }

  # Set Tab(s) and configure them as 
  # per the config. 
  foreach my $tab_name (keys %{$config->{exconf}})
  {
    my $work_tab = $wb->add_worksheet($tab_name);
    $self->worktab($work_tab);

    # shorthand for current tab config
    my $tab_config  = $self->{conf}{exconf}{$tab_name}; 

    # get the tab theme
    my $theme = $tab_config->{theme} || 'theme_1';

    # set row and col freeze
    if ($tab_config->{row_freeze} || $tab_config->{col_freeze}) 
    {
      my $row_freeze = $tab_config->{row_freeze} || undef;
      my $col_freeze = $tab_config->{col_freeze} || undef;
      $work_tab->freeze_panes($row_freeze, $col_freeze);
    }

    # associate tab data in config
    $tab_config->{tab_data} = $data->{$tab_name};

    # set configured tab color or set default 
    $work_tab->set_tab_color(
      $tab_config->{tab_color} || get_random_color()
    );

    # write merged_header if set in conf
    if ($tab_config->{has_merged_headers}) 
    {
      my $merge_config_list = $tab_config->{has_merged_headers}; 
      for my $i (0 .. $#{$merge_config_list})
      {
        my $merge_config = $merge_config_list->[$i];

        # attach merge_format to workbook 
        my $merge_format = $wb->add_format( 
          %{$config->{exthemes}{$theme}{merge_format}[$i]},
        );

        # set merged row height
        $work_tab->set_row(
          0,
          $merge_config->{row_size} || 20,
        );

        # write merged header 
        #
        # check for single cell merge.
        my ($left,$right) = ( 
          (split (/:/,$merge_config->{merge_range_size}))[0],
          (split (/:/,$merge_config->{merge_range_size}))[1]
        );

        # if single cell, then
        # do not merge, just write.
        if ($left eq $right) 
        {
          $work_tab->write(
            $left,
            $merge_config->{merge_range_text},
            $merge_format,
          );
        }
        # if not single cell, merge it.
        else
        {
          $work_tab->merge_range(
           $merge_config->{merge_range_size},
           $merge_config->{merge_range_text},
           $merge_format,
          );
        }
      }

      # Handle Header and related 
      # configuration.
      if ($tab_config->{headers}) 
      {
        my $header_config_list = $tab_config->{headers};
        for my $i (0 .. $#{$header_config_list})
        {
          my $header_config = $header_config_list->[$i];

          my $tab_header = $header_config->{fields};
          my $header_row_num = $header_config->{row_number};

          # set header format from theme
          # and add it to workbook
          my $header_format = $wb->add_format( 
            %{$config->{exthemes}{$theme}{header_format}[$i]},
          );

          # if autofilter is ON
          my $max_header_col = scalar @$tab_header -1 ;
          if ($header_config->{autofilter})
          {
            $work_tab->autofilter(
              $header_row_num,
              0,
              $header_row_num,
              $max_header_col,
            );  
          } 

          # write header
          for my $header_col_num (0 .. $#{$tab_header})
          {
            $work_tab->write(
              $header_row_num,
              $header_col_num,
              $tab_header->[$header_col_num],
              $header_format,
            );
          }
        }
      }
      else
      {
       die "Need header config or will not proceed!\n";
      }

      # write data
      next if !$tab_config->{tab_data};

      my $data = $tab_config->{tab_data};
      my $current_row = $tab_config->{tab_data_row_start_num};
      my $null_format = $wb->add_format( %{$config->{exformats}{null_format}} );

      # get the data format from the 
      # theme and set it.
      my $data_format = $wb->add_format( 
        %{$config->{exthemes}{$theme}{data_format}}, 
      );

      # override data cell format parameters
      if ($tab_config->{override}) {
        if ($tab_config->{override}{data_cell_bg_color}) {
          $data_format->set_bg_color(
            $tab_config->{override}{data_cell_bg_color}
          );
        }
      }

      for my $row_array (@$data)
      {
        # for conditional formatting
        my $max_col = scalar @$row_array - 1;
        $work_tab->conditional_formatting(
          $current_row,
          0,
          $current_row,
          $max_col,
          {
            type => 'text',
            criteria => 'begins with',
            value => 'NULL',
            format => $null_format,
          },
        );

        # normal writing
        $work_tab->write(
          $current_row,
          0,
          $row_array,
          $data_format
        );
        $current_row++;
      }
    }
  }

  if (!$self->close_excel()){
    print "WARNING: Excel file wasn't properly closed!\n";
  }
  return $self;
}

sub workbook {
  my $self = shift;
  return $self->{workbook};
}

sub worktab {
  my ($self,$worktab) = @_;

  if (scalar @_ == 2)
  {
    $self->{worktab} = $worktab;
  }
  else
  {
    return $self->{worktab};
  }
}

sub get_random_color 
{
  my @colors = qw
  (
    black     blue      brown
    cyan      gray      green
    lime      magenta   navy
    orange    pink      purple
    red       silver    white 
    yellow
  );

  my @shuffled = shuffle(@colors);
  return $shuffled[0];
}

sub close_excel {
  my $self = shift;
  return $self->{workbook}->close();
}

1;
