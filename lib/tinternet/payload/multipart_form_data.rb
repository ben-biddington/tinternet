module T
  class MultipartFormData # https://www.ietf.org/rfc/rfc2388.txt
    attr_reader :fields, :files
    
    def initialize(fields={}, files={})
      @fields = fields
      @files  = files
    end
    
    def to_hash; @fields.merge(@files); end
  end
end