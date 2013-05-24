require 'openldap_monitor_extractor/connection'
require 'openldap_monitor_extractor/formatters'
require 'openldap_monitor_extractor/mapper'


module OpenldapMonitorExtractor
    
  class InvalidKey < StandardError; end

  
  class Data

    def initialize(connection, mapper=OpenldapMonitorExtractor::Mapper)
    
      @connection = connection
      @mapper     = mapper
      
      self
    end
    
    def get(key, formater=OpenldapMonitorExtractor::Formatters::Raw)
      
      raise InvalidKey.new("Invalid key: #{key}") unless @mapper::DNS.keys.include?(key)
      
      entry = @connection.search( 
        :base          =>@mapper::DNS[key][:dn], 
        :filter        =>Net::LDAP::Filter.eq("objectClass", "*"),
        :attributes    =>[@mapper::DNS[key][:attribute]],
        :return_result =>true)

      formater.render(entry[0], :separator =>',')
    end
  end
end