#!/usr/bin/env ruby


require 'rubygems'
require 'yaml'
require 'openldap_monitor_extractor'


CONFIG_FILE = File.join(File.dirname(__FILE__), %w{.. config ldap_sample_settings.yml})

config     = YAML.load_file(CONFIG_FILE)
connection = OpenldapMonitorExtractor::Connection.new(config).connection
OpenldapMonitorExtractor::Data.new(connection).get(:totalConnections)