require 'openldap_monitor_stats/connection'


module OpenldapMonitorExtractor
    
  class InvalidKey < StandardError; end

  
  class MonitorInfo

    def initialize(connection, mapper=MonitorMapper)
    
      @connection = connection
      @mapper     = mapper
      
      self
    end
    
    def get(key, formater)
      
      raise InvalidKey.new("Invalid key: #{key}") unless DN.keys.include?(key)
      
      entry = @connection.search( 
        :base          =>@mapper::DNS[key][:dn], 
        :filter        =>Net::LDAP::Filter.eq("objectClass", "*"),
        :attributes    =>[@mapper::DNS[key][:attribute]],
        :return_result =>true)

      # TODO: Out with formater
      entry[0][@mapper::DNS[key][:attribute]] if entry
    end
    # 
    # def get_all(formater)
    #   
    #   values = []
    #   @mapper::DNS_KEYS.each { |key| values << get(key) }
    # 
    #   values
    # end
  end
end