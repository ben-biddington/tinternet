module T
  class XWwwFormUrlencoded # https://www.ietf.org/rfc/rfc2388.txt
    def initialize(fields={})
      @fields = fields
    end
    
    def to_s
      [].tap do |result|
        @fields.each_pair do |name, value|
          result << "#{encode(name)}=#{encode(value)}"
        end
      end.join "&"
    end
    
    private
    
    def encode(what)
      URI.escape(what)
    end
  end
end