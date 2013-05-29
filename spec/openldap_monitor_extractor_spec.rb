$:.unshift File.dirname(__FILE__)


require 'spec_helper'
require 'openldap_monitor_extractor/version'


describe OpenldapMonitorExtractor do

  it 'should have a version number' do
    
    OpenldapMonitorExtractor::VERSION.should_not be_nil
  end
end