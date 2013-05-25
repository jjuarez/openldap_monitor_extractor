#!/usr/bin/env ruby

$:.unshift File.join(File.dirname(__FILE__), %w{.. lib})

require 'rubygems'
require 'yaml'
require 'openldap_monitor_extractor'


config_file = File.join(File.dirname(__FILE__), %w{.. config ldap_sample_settings.yml})
config      = YAML.load_file(config_file)

OpenldapMonitorExtractor.configure(config)
puts OpenldapMonitorExtractor.get(:total_connections).inspect