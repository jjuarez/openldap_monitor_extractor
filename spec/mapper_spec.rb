$:.unshift File.dirname(__FILE__)


require 'spec_helper'
require 'openldap_monitor_extractor/monitor_data'


describe OpenldapMonitorExtractor::Mapper do

  describe "#validate_key" do

    it 'should validate keys' do
      
      OpenldapMonitorExtractor::Mapper::KEYS.each { |k| OpenldapMonitorExtractor::Mapper.validate_key(k).should eq(true) }
    end

    it 'should validate :all as key' do
      
      OpenldapMonitorExtractor::Mapper.validate_key(:all).should eq(true)
    end
  end

  describe "#keys" do
  
    it 'should return all the keys' do
      
      OpenldapMonitorExtractor::Mapper.dns().should eq(OpenldapMonitorExtractor::Mapper::KEYS)
    end
    
    it 'should return all the keys as an Array' do
      
      OpenldapMonitorExtractor::Mapper.dns().should be_an_instance_of(Array)
    end
  end

  describe "#dn" do
    
    it 'should return the DN for a key' do
      
      OpenldapMonitorExtractor::Mapper::KEYS.each do |k| 
        OpenldapMonitorExtractor::Mapper.dn(k).should eq(OpenldapMonitorExtractor::Mapper::MAPPER[k][:dn])
      end
    end
    
    it "should return the DN as a String" do
    
      OpenldapMonitorExtractor::Mapper::KEYS.each do |k| 
        OpenldapMonitorExtractor::Mapper.dn(k).should be_an_instance_of(String)
      end
    end
    
    it "should retulr the DN as a base of cn=Monitor" do
      
      OpenldapMonitorExtractor::Mapper::KEYS.each do |k| 
        OpenldapMonitorExtractor::Mapper.dn(k).should match(/(.+),cn=Monitor/)
      end        
    end
  end

  describe "#attribute" do
    
    it 'should return the attribute for a key' do
      
      OpenldapMonitorExtractor::Mapper::KEYS.each do |k|         
        OpenldapMonitorExtractor::Mapper.attribute(k).should eq(OpenldapMonitorExtractor::Mapper::MAPPER[k][:attribute])
      end
    end
      
    it 'should return the attribute for a key as a Symbol' do
      
      OpenldapMonitorExtractor::Mapper::KEYS.each do |k| 
        OpenldapMonitorExtractor::Mapper.attribute(k).should be_an_instance_of(Symbol)
      end
    end
  end
  
  describe "#type" do
    
    it 'should return the type for a key' do
      
      OpenldapMonitorExtractor::Mapper::KEYS.each do |k|      
        OpenldapMonitorExtractor::Mapper.type(k).should eq(OpenldapMonitorExtractor::Mapper::MAPPER[k][:type])
      end  
    end
      
    it 'should return the type for a key as a Symbol' do

      OpenldapMonitorExtractor::Mapper::KEYS.each do |k|      
        OpenldapMonitorExtractor::Mapper.type(k).should be_an_instance_of(Symbol)
      end
    end
  end
end