require 'openldap_monitor_extract/connection'
require 'openldap_monitor_extract/formatters'


module OpenldapMonitorExtractor
    
  class InvalidKey < StandardError; end

  
  class Data

    def initialize(connection, mapper=Mapper)
    
      @connection = connection
      @mapper     = mapper
      
      self
    end
    
    def get(key, formater=Formatters::Raw)
      
      raise InvalidKey.new("Invalid key: #{key}") unless DN.keys.include?(key)
      
      entry = @connection.search( 
        :base          =>@mapper::DNS[key][:dn], 
        :filter        =>Net::LDAP::Filter.eq("objectClass", "*"),
        :attributes    =>[@mapper::DNS[key][:attribute]],
        :return_result =>true)

      formater.render(entry[0], :separator =>',')
    end
  end
end