#!/usr/bin/env ruby

$:.unshift File.join(File.dirname(__FILE__), %w{.. lib})


require 'rubygems'
require 'yaml'
require 'openldap_monitor_extractor'


unless ARGV[0] && File.exist?(ARGV[0])

  puts "usage: #{$0} config_file.yml"
  Kernel.exit 1
end

  
config = YAML.load_file(ARGV[0])
puts OpenldapMonitorExtractor::Core.new(config).get(:all).inspect