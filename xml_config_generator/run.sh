#!/bin/bash

path="/home/gaurav/study/pl/rectool"
config_file="$path/config/config.xml"

>$config_file

{
  echo '<config>'
  $(which perl) gen_file_xml_config.pl source_file.csv target_file.csv|sed 's/^/  /'
  $(which perl) gen_xml_from_pm.pl | sed 's/^/  /g' 
  echo '</config>'
} >> $config_file
