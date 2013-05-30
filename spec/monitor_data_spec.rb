$:.unshift File.dirname(__FILE__)


require 'spec_helper'
require 'openldap_monitor_extractor/monitor_data'


describe OpenldapMonitorExtractor::MonitorData do

  describe "#transform" do

    it '#should transform to an integer' do
  
      OpenldapMonitorExtractor::MonitorData.transform(10,     :counter).should equal(10)
      OpenldapMonitorExtractor::MonitorData.transform("Fail", :counter).should equal(0)

      expect { OpenldapMonitorExtractor::MonitorData.transform(10, :foo) }.to raise_error(ArgumentError)
    end

    it '#should transform to a timestamp' do
  
      OpenldapMonitorExtractor::MonitorData.transform("20130530Z", :timestamp).should be_an_instance_of Time
      OpenldapMonitorExtractor::MonitorData.transform("20130530Z", :timestamp).should eq(Time.parse("20130530Z"))

      expect { OpenldapMonitorExtractor::MonitorData.transform("fodate", :timestamp) }.to raise_error(ArgumentError)
    end
  end

  describe "#add" do
  
    it 'should create a valid object whit add method' do
  
      md = OpenldapMonitorExtractor::MonitorData.new(OpenldapMonitorExtractor::Mapper)

      md.should be_an_instance_of OpenldapMonitorExtractor::MonitorData   
      md.should respond_to :add
      
      md.add(:total_connections, [{ :monitorcounter =>0, :type =>:counter }]).should be_an_instance_of OpenldapMonitorExtractor::MonitorData
      md.data.should be_an_instance_of OpenStruct 
      md.data.should respond_to :total_connections
      md.data.total_connections.should equal(0)
      
      expect { md.add(:foo, [{ :monitorcounter =>0, :type =>:counter }]) }.to raise_error(ArgumentError)
      md.data.should be_an_instance_of OpenStruct 
      md.data.should respond_to :total_connections
      md.data.total_connections.should equal(0)      
    end
  end
end