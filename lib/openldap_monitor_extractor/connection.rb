require 'rubygems'
require 'net/ldap'
require 'uri'


module OpenldapMonitorExtractor
    
  class AuthenticationError < StandardError; end
  
  class Connection

    attr_reader :connection

    private
    def self.builder(parameters={ })

      parameters  = { :url => "ldap://localhost", username =>"foo", :password =>"secret", :base =>"cn=Monitor" }.merge(parameters)
      uri         = URI.parse(parameters[:url])
      cparameters = {
	      :host =>uri.host,
	      :port =>uri.port,
	      :base =>parameters[:base],
	      :auth =>{ 
          :method   =>:simple, 
          :username =>parameters[:username], 
          :password =>parameters[:password] 
        }
      }
      
      cparamenters[:encryption] = { :method =>:simple_tls } if uri.shecheme == "ldaps"
      
      Net::LDAP.new(cparemters)
    end
    
    public
    def initialize(parameters={ })

      @connection = self.builder(parameters)
      
      raise AuthenticationError.new("Can not bind with username: #{username}") unless @connection.bind

      self 
    end    
  end
end