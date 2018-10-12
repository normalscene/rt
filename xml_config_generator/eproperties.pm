package eproperties;

use strict;
use warnings;

our $props =
{
  title => 'Test Excel Workbook',
  author => 'Mr. Author',
  comments => 'Created with Excel::Writer::XLSX with perl 5.28',
  subject => 'Just for testing',
  manager => 'No One',
  company =>  'Dummy Corp.',
  category => 'General',
  keywords => undef,
  status => 'Valid till 2019',
  hyperlink_base => 'www.google.com',
  #created - File create date. Such be an aref of gmtime() values.
};

1;
