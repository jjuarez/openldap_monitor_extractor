require 'rubygems'
require 'net/ldap'
require 'uri'


module OpenldapMonitorExtractor
    
  class AuthenticationError < StandardError; end
  
  class Connection

    attr_reader :connection

    def self.builder(parameters={ })

      parameters  = { :url => "ldap://localhost", :username =>"foo", :password =>"secret", :base =>"cn=Monitor" }.merge(parameters)
      uri         = URI.parse(parameters[:url])
      auth        = { 
        :method   =>:simple, 
        :username =>parameters[:username], 
        :password =>parameters[:password] 
      }
      
      cparameters = {
	      :host =>uri.host,
	      :port =>uri.port,
	      :base =>parameters[:base],
	      :auth =>auth
      }
      
      cparameters[:encryption] = { :method =>:simple_tls } if uri.scheme == "ldaps"
      
      Net::LDAP.new(cparameters)
    end
    
    def initialize(parameters={ })

      @connection = Connection::builder(parameters)
      
      raise AuthenticationError.new("Can not bind with username: #{username}") unless @connection.bind

      self 
    end    
  end
end