require "time"
require "ostruct"


module OpenldapMonitorExtractor

  class MonitorData
    
    attr_reader :data
    
    def self.transform(data, type)
      
      case type
        when :counter   then data.to_i
        when :timestamp then Time.parse(data)
      else 
        ArgumentError.new("Invalid data type: #{type}")
      end      
    end
    
    def initialize(mapper=Mapper)
      
      @data   = OpenStruct.new
      @mapper = mapper
      
      self
    end
    
    def add(key, entry)
      
      type    = @mapper.type(key)
      value   = entry[0][@mapper.attribute(key)][0]
      t_value = MonitorData.transform(value, type)
      
      @data.send("#{key}=", t_value)
    end
    
    def inspect()
      @data.inspect
    end
    
    def to_s()
      "#{inspect()}"
    end
  end
end