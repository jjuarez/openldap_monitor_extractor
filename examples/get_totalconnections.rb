#!/usr/bin/env ruby

$:.unshift File.join(File.dirname(__FILE__), %w{.. lib})


require 'rubygems'
require 'yaml'
require 'openldap_monitor_extractor'


config = YAML.load_file(ARGV[0])

OpenldapMonitorExtractor.configure(config)
puts OpenldapMonitorExtractor.get(:total_connections)
