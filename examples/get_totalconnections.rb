#!/usr/bin/env ruby

$:.unshift File.join(File.dirname(__FILE__), %w{.. lib})


require 'rubygems'
require 'yaml'
require 'openldap_monitor_extractor'


if ARGV[0] && File.exist?(ARGV[0])
  
  config = YAML.load_file(ARGV[0])
  puts OpenldapMonitorExtractor.configure(config).get(:total_connections)
else
  
  puts "usage: #{$0} config_file.yml"
end