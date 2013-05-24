#!/usr/bin/env ruby

$:.unshift File.join(File.dirname(__FILE__), %w{.. lib})

require 'rubygems'
require 'yaml'
require 'openldap_monitor_extractor'


config     = YAML.load_file(File.join(File.dirname(__FILE__), %w{.. config ldap_sample_settings.yml}))

puts OpenldapMonitorExtractor::Data.new(OpenldapMonitorExtractor::Connection.new(config).connection).get(:total_connections)