module T
  class Request
    attr_accessor :verb, :uri, :headers, :body
    
    def initialize(opts = {})
      self.verb    = opts[:verb] || :get
      self.uri     = opts[:uri] 
      self.headers = opts[:headers] || {} 
      self.body    = opts[:body] 
    end

    def authorize(header_value)
      headers[auth_header_name] = header_value
    end

    def authorized?
      headers.include? auth_header_name 
    end

    def auth_header_name; "Authorization"; end
  end

  Response = Struct.new "Response", :code, :headers, :body

  SslClientCertificate = Struct.new "SslClientCertificate", :cert, :key, :verify_ssl

  require File.join "adapters", "rest_client_internet"
  
  Internet = RestClientInternet
end