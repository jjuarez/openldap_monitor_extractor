module OpenldapMonitorExtractor

  class Mapper
    
    MAPPER = {
    
      :start_time           =>{ :dn =>"cn=Start,cn=Time,cn=Monitor",          :attribute =>:monitortimestamp,   :type =>:timestamp },
      :current_time         =>{ :dn =>"cn=Current,cn=Time,cn=Monitor",        :attribute =>:monitortimestamp,   :type =>:timestamp },
    
      :total_connections    =>{ :dn =>"cn=Total,cn=Connections,cn=Monitor",   :attribute =>:monitorcounter,     :type =>:counter },

      :pdu_statistics       =>{ :dn =>"cn=PDU,cn=Statistics,cn=Monitor",      :attribute =>:monitorcounter,     :type =>:counter },
      :referals_statistics  =>{ :dn =>"cn=Referrals,cn=Statistics,cn=Monitor",:attribute =>:monitorcounter,     :type =>:counter },
      :bytes_statistics     =>{ :dn =>"cn=Bytes,cn=Statistics,cn=Monitor",    :attribute =>:monitorcounter,     :type =>:counter },
      :entries_statistics   =>{ :dn =>"cn=Entries,cn=Statistics,cn=Monitor",  :attribute =>:monitorcounter,     :type =>:counter },

      :initiated_operations =>{ :dn =>"cn=Operations,cn=Monitor",             :attribute =>:monitoropinitiated, :type =>:counter },
      :completed_operations =>{ :dn =>"cn=Operations,cn=Monitor",             :attribute =>:monitoropcompleted, :type =>:counter },
      :bind_operations      =>{ :dn =>"cn=Bind,cn=Operations,cn=Monitor",     :attribute =>:monitoropcompleted, :type =>:counter },
      :unbind_operations    =>{ :dn =>"cn=Unbind,cn=Operations,cn=Monitor",   :attribute =>:monitoropcompleted, :type =>:counter },
      :search_operations    =>{ :dn =>"cn=Search,cn=Operations,cn=Monitor",   :attribute =>:monitoropcompleted, :type =>:counter },
      :compare_operations   =>{ :dn =>"cn=Compare,cn=Operations,cn=Monitor",  :attribute =>:monitoropcompleted, :type =>:counter },
      :modify_operations    =>{ :dn =>"cn=Modify,cn=Operations,cn=Monitor",   :attribute =>:monitoropcompleted, :type =>:counter },
      :modrdn_operations    =>{ :dn =>"cn=Modrdn,cn=Operations,cn=Monitor",   :attribute =>:monitoropcompleted, :type =>:counter },
      :add_operations       =>{ :dn =>"cn=Add,cn=Operations,cn=Monitor",      :attribute =>:monitoropcompleted, :type =>:counter },
      :delete_operations    =>{ :dn =>"cn=Delete,cn=Operations,cn=Monitor",   :attribute =>:monitoropcompleted, :type =>:counter },
      :abandon_operations   =>{ :dn =>"cn=Abandon,cn=Operations,cn=Monitor",  :attribute =>:monitoropcompleted, :type =>:counter },
      :extended_operations  =>{ :dn =>"cn=Extended,cn=Operations,cn=Monitor", :attribute =>:monitoropcompleted, :type =>:counter },

      :write_waiters        =>{ :dn =>"cn=Write,cn=Waiters,cn=Monitor",       :attribute =>:monitorcounter,     :type =>:counter },
      :read_waiters         =>{ :dn =>"cn=Read,cn=Waiters,cn=Monitor",        :attribute =>:monitorcounter,     :type =>:counter }
    }
  
    KEYS = MAPPER.keys

  
    def self.validate_key(key)  
      key == :all || KEYS.include?(key)
    end
    
    def self.dns()
      KEYS
    end
    
    def self.dn(key)
      MAPPER[key][:dn]
    end
    
    def self.attribute(key)
      MAPPER[key][:attribute]
    end
    
    def self.type(key)
      MAPPER[key][:type]
    end
  end  
end