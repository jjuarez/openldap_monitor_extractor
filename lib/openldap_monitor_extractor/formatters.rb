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
    
module OpenldapMonitorExtractor
  module Formatters
    
    class CSV < Formatters::Base
      
      DEFAULT_SEPARATOR = ";"
      
      def self.render(data, options={ }, &block)
        
        options = { :separator => DEFAULT_SEPARATOR }.merge(options)
        values  = []
        result  = ""
        
        data.keys.each { |k| values << data[k] }
        result << data.keys.join(options[:separator]) << "\n" << values.join(options[:separator])
      end
    end
  end
end

puts OpenldapMonitorExtractor::Formatters::CSV.render({:HEADER_A=>10, :HEADER_B=>20})