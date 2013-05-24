module OpenldapMonitorExtractor

  class MonitorMapper
    
    DNS = {
      :total_connections    =>{ :dn =>"cn=Total,cn=Connections,cn=Monitor",   :attribute =>:monitorcounter,     :pretty_header =>"Total Connections"    },
      :referals_statistics  =>{ :dn =>"cn=Referrals,cn=Statistics,cn=Monitor",:attribute =>:monitorcounter,     :pretty_header =>"Referals Statistics"  },
      :bytes_statistics     =>{ :dn =>"cn=Bytes,cn=Statistics,cn=Monitor",    :attribute =>:monitorcounter,     :pretty_header =>"Bytes Statistics"     },
      :entries_statistics   =>{ :dn =>"cn=Entries,cn=Statistics,cn=Monitor",  :attribute =>:monitorcounter,     :pretty_header =>"Entries Statistics"   },
      :initiated_operations =>{ :dn =>"cn=Operations,cn=Monitor",             :attribute =>:monitoropinitiated, :pretty_header =>"Initiated Operations" },
      :completed_operations =>{ :dn =>"cn=Operations,cn=Monitor",             :attribute =>:monitoropcompleted, :pretty_header =>"Completed Operations" },
      :bind_operations      =>{ :dn =>"cn=Bind,cn=Operations,cn=Monitor",     :attribute =>:monitoropcompleted, :pretty_header =>"Binds"                },
      :unbind_operations    =>{ :dn =>"cn=Unbind,cn=Operations,cn=Monitor",   :attribute =>:monitoropcompleted, :pretty_header =>"Unbinds"              },
      :search_operations    =>{ :dn =>"cn=Search,cn=Operations,cn=Monitor",   :attribute =>:monitoropcompleted, :pretty_header =>"Searches"             },
      :compare_operations   =>{ :dn =>"cn=Compare,cn=Operations,cn=Monitor",  :attribute =>:monitoropcompleted, :pretty_header =>"Compares"             },
      :modify_operations    =>{ :dn =>"cn=Modify,cn=Operations,cn=Monitor",   :attribute =>:monitoropcompleted, :pretty_header =>"Modifies"             },
      :modrdn_operations    =>{ :dn =>"cn=Modrdn,cn=Operations,cn=Monitor",   :attribute =>:monitoropcompleted, :pretty_header =>"ModRDNs"              },
      :add_operations       =>{ :dn =>"cn=Add,cn=Operations,cn=Monitor",      :attribute =>:monitoropcompleted, :pretty_header =>"Adds"                 },
      :delete_operations    =>{ :dn =>"cn=Delete,cn=Operations,cn=Monitor",   :attribute =>:monitoropcompleted, :pretty_header =>"Deletes"              },
      :abandon_operations   =>{ :dn =>"cn=Abandon,cn=Operations,cn=Monitor",  :attribute =>:monitoropcompleted, :pretty_header =>"Abandons"             },
      :extended_operations  =>{ :dn =>"cn=Extended,cn=Operations,cn=Monitor", :attribute =>:monitoropcompleted, :pretty_header =>"Extendeds"            },
      :write_waiters        =>{ :dn =>"cn=Write,cn=Waiters,cn=Monitor",       :attribute =>:monitorcounter,     :pretty_header =>"Writes"               },
      :read_waiters         =>{ :dn =>"cn=Read,cn=Waiters,cn=Monitor",        :attribute =>:monitorcounter,     :pretty_header =>"Reads"                }
    }
    
    KEYS = DNS.keys
  end
end