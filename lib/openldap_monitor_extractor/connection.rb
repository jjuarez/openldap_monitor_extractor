require 'rubygems'
require 'net/ldap'
require 'uri'


module OpenldapMonitorExtractor
    
  class Connection

    DEFAULT_MONITOR_BASE = "cn=Monitor"
    
    attr_reader :connection

    def self.builder(parameters={ })

      uri         = URI.parse(parameters[:url])
      auth        = { 
        :method   =>:simple, 
        :username =>parameters[:username], 
        :password =>parameters[:password] 
      }
      
      cparameters = {
	      :host =>uri.host,
	      :port =>uri.port,
	      :base =>DEFAULT_MONITOR_BASE,
	      :auth =>auth
      }
      
      cparameters[:encryption] = { :method =>:simple_tls } if uri.scheme == "ldaps"
      
      Net::LDAP.new(cparameters)
    end
    
    def initialize(parameters={ })

      @connection = Connection::builder(parameters)
      
      self 
    end
  end
end