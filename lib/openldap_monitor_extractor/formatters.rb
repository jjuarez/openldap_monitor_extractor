module OpenldapMonitorExtractor  
  module Formatters
    
    module Formatter
      extend self
    
      def render(data, options={ }, &block); end
    end
  end
end

module OpenldapMonitorExtractor
  module Formatters
    
    class Base
      include Formatter
      
      def self.render(data, options={ }, &block)
        raise StandardError.new("Not implemented")
      end
    end
  end
end  

module OpenldapMonitorExtractor
  module Formatters
    
    class Raw < Formatters::Base
      
      def self.render(data, options={ }, &block)
        "#{data.inspect}"
      end
    end
  end
end