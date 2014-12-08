module T
  class XWwwFormUrlencoded # https://www.ietf.org/rfc/rfc2388.txt
    attr_reader :fields
    
    def initialize(fields={})
      @fields = fields
    end
    
    def to_hash; @fields; end
    
    private
    
    def encode(what)
      URI.escape(what)
    end
  end
end