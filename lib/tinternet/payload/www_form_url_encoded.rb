module T
  class XWwwFormUrlencoded
    def initialize(parameters={})
      @parameters = parameters
    end
    
    def to_s
      result = []
      
      @parameters.each_pair do |name, value|
        result << "#{encode(name)}=#{encode(value)}"
      end
      
      result.join "&"
    end
    
    private
    
    def encode(what)
     URI.escape(what)
    end
  end
end