require "spec_helper"

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

	class Internet
		require "rest_client"
		require "audible"; include Audible

		def initialize(opts ={})
			@ssl_client_cert = opts[:ssl_client_cert]
			@proxy           = opts[:proxy]
		end

		def execute(request); try_execute request; end

		private
    
		def try_execute(request)
			begin
				execute_core request
			rescue RestClient::RequestTimeout => t
				timeout t
			rescue RestClient::Exception => e
				non_20x e
			end
		end

		def non_20x(e)
			Response.new(e.response.code, e.response.headers, e.response.body)
		end

		def timeout(error)
			Response.new(-1, {}, "The request timed out after #{request_timeout_in_seconds}s.")
		end

		def execute_core(request)
			apply_proxy if proxy?
      
			notify_requesting request
    
			reply = RestClient::Request.execute(opts_for(request))

			Response.new(200, reply.headers, reply)
		end
    
		def opts_for(request)
			{
				:method  => request.verb, 
				:url     => request.uri.to_s, 
				:headers => request.headers, 
				:payload => request.body, 
				:timeout => request_timeout_in_seconds
			}.merge ssl_opts
		end
  
		def request_timeout_in_seconds; 30; end

		def ssl_opts
			return {} unless ssl_client_cert?
			{
				:ssl_client_cert => OpenSSL::X509::Certificate.new(File.read(@ssl_client_cert.cert)),
				:ssl_client_key  => OpenSSL::PKey::RSA.new(File.read(@ssl_client_cert.key)),
				:verify_ssl      => @ssl_client_cert.verify_ssl
			}
		end

		def apply_proxy; RestClient.proxy = @proxy; end
		def ssl_client_cert?; @ssl_client_cert; end
		def proxy?; @proxy; end

		def notify_requesting(request)
			notify :requesting, request
		end
	end
end

describe "The basics" do
  it "can connect" do
    internet = T::Internet.new
		reply = internet.execute T::Request.new :uri => "https://go.xero.com"
		expect(reply.code).to eql 200
  end
end	 