#!/usr/bin/env perl

use econf;
use ethemes;
use eformats;
use eproperties;

use strict;
use Data::Dumper;
use XML::Simple qw(XMLout);

my $exconf = $econf::conf;
my $exthemes = $ethemes::themes;
my $exformats = $eformats::formats;
my $exproperties = $eproperties::props;

print "\n";
print XMLout( $exconf, RootName => 'exconf',); 

print "\n";
print XMLout($exthemes, RootName => 'exthemes',); 

print "\n";
print XMLout($exformats, RootName => 'exformats',); 

print "\n";
print XMLout($exproperties, RootName => 'exprops',); 
