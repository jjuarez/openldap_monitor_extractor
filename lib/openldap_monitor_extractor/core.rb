require "openldap_monitor_extractor/connection"
require "openldap_monitor_extractor/mapper"
require "openldap_monitor_extractor/monitor_data"


module OpenldapMonitorExtractor

  class Core
   
    def initialize(config, options={ })
    
      options     = { :mapper =>Mapper }.merge(options)
      
      @connection = Connection.new(config).connection
      @mapper     = options[:mapper]
    
      self
    end
  
  
    def get_monitor_parameter(dn, attribute, options={ })
      
      options = { :filter =>Net::LDAP::Filter.eq("objectClass", "*") }.merge(options)
    
      @connection.search(
        :filter     =>options[:filter],
        :base       =>dn, 
        :attributes =>[attribute]) 
    end


    def get(key=:all)

      raise ArgumentError.new("Monitor invalid key: #{key}") unless @mapper.validate_key(key)

      result   = MonitorData.new()
      key_list = (key == :all) ? @mapper::dns() : [key]

      key_list.each do |k|
    
        dn        = @mapper.dn(k)
        attribute = @mapper.attribute(k)
        entry     = get_monitor_parameter(dn, attribute)
        
        raise StandardError.new("Problems getting Monitor for data: #{dn}") unless entry
      
        result.add(k, entry)
      end
    
      result
    end
  end
end