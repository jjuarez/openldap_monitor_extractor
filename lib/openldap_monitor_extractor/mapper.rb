module OpenldapMonitorExtractor

  class Mapper
    
    DNS = {
      :total_connections    =>{ :dn =>"cn=Total,cn=Connections,cn=Monitor",   :attribute =>:monitorcounter      },
      :referals_statistics  =>{ :dn =>"cn=Referrals,cn=Statistics,cn=Monitor",:attribute =>:monitorcounter      },
      :bytes_statistics     =>{ :dn =>"cn=Bytes,cn=Statistics,cn=Monitor",    :attribute =>:monitorcounter      },
      :entries_statistics   =>{ :dn =>"cn=Entries,cn=Statistics,cn=Monitor",  :attribute =>:monitorcounter      },
      :initiated_operations =>{ :dn =>"cn=Operations,cn=Monitor",             :attribute =>:monitoropinitiated  },
      :completed_operations =>{ :dn =>"cn=Operations,cn=Monitor",             :attribute =>:monitoropcompleted  },
      :bind_operations      =>{ :dn =>"cn=Bind,cn=Operations,cn=Monitor",     :attribute =>:monitoropcompleted  },
      :unbind_operations    =>{ :dn =>"cn=Unbind,cn=Operations,cn=Monitor",   :attribute =>:monitoropcompleted  },
      :search_operations    =>{ :dn =>"cn=Search,cn=Operations,cn=Monitor",   :attribute =>:monitoropcompleted  },
      :compare_operations   =>{ :dn =>"cn=Compare,cn=Operations,cn=Monitor",  :attribute =>:monitoropcompleted  },
      :modify_operations    =>{ :dn =>"cn=Modify,cn=Operations,cn=Monitor",   :attribute =>:monitoropcompleted  },
      :modrdn_operations    =>{ :dn =>"cn=Modrdn,cn=Operations,cn=Monitor",   :attribute =>:monitoropcompleted  },
      :add_operations       =>{ :dn =>"cn=Add,cn=Operations,cn=Monitor",      :attribute =>:monitoropcompleted  },
      :delete_operations    =>{ :dn =>"cn=Delete,cn=Operations,cn=Monitor",   :attribute =>:monitoropcompleted  },
      :abandon_operations   =>{ :dn =>"cn=Abandon,cn=Operations,cn=Monitor",  :attribute =>:monitoropcompleted  },
      :extended_operations  =>{ :dn =>"cn=Extended,cn=Operations,cn=Monitor", :attribute =>:monitoropcompleted  },
      :write_waiters        =>{ :dn =>"cn=Write,cn=Waiters,cn=Monitor",       :attribute =>:monitorcounter      },
      :read_waiters         =>{ :dn =>"cn=Read,cn=Waiters,cn=Monitor",        :attribute =>:monitorcounter      }
    }
  end
end