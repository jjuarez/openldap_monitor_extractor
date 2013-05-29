require "ostruct"
require "openldap_monitor_extractor/version"
require "openldap_monitor_extractor/connection"


module OpenldapMonitorExtractor
  extend self
  
  class ExtractorError < StandardError
  end 

  MAPPER = {
    :total_connections    =>{ :dn =>"cn=Total,cn=Connections,cn=Monitor",   :attribute =>:monitorcounter     },
    :pdu_statistics       =>{ :dn =>"cn=PDU,cn=Statistics,cn=Monitor",      :attribute =>:monitorcounter     },
    :referals_statistics  =>{ :dn =>"cn=Referrals,cn=Statistics,cn=Monitor",:attribute =>:monitorcounter     },
    :bytes_statistics     =>{ :dn =>"cn=Bytes,cn=Statistics,cn=Monitor",    :attribute =>:monitorcounter     },
    :entries_statistics   =>{ :dn =>"cn=Entries,cn=Statistics,cn=Monitor",  :attribute =>:monitorcounter     },
    :initiated_operations =>{ :dn =>"cn=Operations,cn=Monitor",             :attribute =>:monitoropinitiated },
    :completed_operations =>{ :dn =>"cn=Operations,cn=Monitor",             :attribute =>:monitoropcompleted },
    :bind_operations      =>{ :dn =>"cn=Bind,cn=Operations,cn=Monitor",     :attribute =>:monitoropcompleted },
    :unbind_operations    =>{ :dn =>"cn=Unbind,cn=Operations,cn=Monitor",   :attribute =>:monitoropcompleted },
    :search_operations    =>{ :dn =>"cn=Search,cn=Operations,cn=Monitor",   :attribute =>:monitoropcompleted },
    :compare_operations   =>{ :dn =>"cn=Compare,cn=Operations,cn=Monitor",  :attribute =>:monitoropcompleted },
    :modify_operations    =>{ :dn =>"cn=Modify,cn=Operations,cn=Monitor",   :attribute =>:monitoropcompleted },
    :modrdn_operations    =>{ :dn =>"cn=Modrdn,cn=Operations,cn=Monitor",   :attribute =>:monitoropcompleted },
    :add_operations       =>{ :dn =>"cn=Add,cn=Operations,cn=Monitor",      :attribute =>:monitoropcompleted },
    :delete_operations    =>{ :dn =>"cn=Delete,cn=Operations,cn=Monitor",   :attribute =>:monitoropcompleted },
    :abandon_operations   =>{ :dn =>"cn=Abandon,cn=Operations,cn=Monitor",  :attribute =>:monitoropcompleted },
    :extended_operations  =>{ :dn =>"cn=Extended,cn=Operations,cn=Monitor", :attribute =>:monitoropcompleted },
    :write_waiters        =>{ :dn =>"cn=Write,cn=Waiters,cn=Monitor",       :attribute =>:monitorcounter     },
    :read_waiters         =>{ :dn =>"cn=Read,cn=Waiters,cn=Monitor",        :attribute =>:monitorcounter     }
  }
  
  KEYS = MAPPER.keys
  
  private 
  def get_monitor_parameter(dn, attribute)
    
    @connection.search(
      :filter     =>Net::LDAP::Filter.eq("objectClass", "*"),
      :base       =>dn, 
      :attributes =>[attribute]) 
  end
    
    
  public
  def configure(config) 
    
    @connection ||= Connection.new(config).connection
    self
  end
  
  
  def validate_key(key)
  
    key == :all || KEYS.include?(key)
  end
  
  
  def get(key=:all)

    raise ExtractorError.new("You need to configure a valid LDAP connection") unless @connection
    raise ArgumentError.new("Invalid key: #{key}, valid keys are: #{KEYS.inspect}") unless validate_key(key)
    
    result = OpenStruct.new()
    keys   = (key == :all ? KEYS : [key]) 

    keys.each do |k|
    
      dn    = MAPPER[k][:dn]
      attr  = MAPPER[k][:attribute]
      entry = get_monitor_parameter(dn, attr)
        
      raise ExtractorError.new("Problems getting #{dn} data") unless entry
    
      result.send("#{k}=", entry[0][attr][0].to_i)
    end
    
    result
  rescue Exception => exc
    raise ExtractorError.new(exc.message)
  end
end