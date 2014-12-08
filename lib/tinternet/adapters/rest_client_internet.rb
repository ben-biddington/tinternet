class RestClientObserver
  require 'audible'; extend Audible
  require 'restclient'
  RestClient.log = self
  
  class << self
    def <<(message)
      notify :progress, message
    end
  end
end

class RestClientInternet
  require "rest_client"
  require "audible"; include Audible; extend Audible
  
  def initialize(opts ={})
    @ssl_client_cert = opts[:ssl_client_cert]
    @proxy           = opts[:proxy]
    RestClientObserver.on(:progress) {|e,args| notify :progress, args.first}
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
    T::Response.new(e.response.code, e.response.headers, e.response.body)
  end

  def timeout(error)
    T::Response.new(-1, {}, "The request timed out after #{request_timeout_in_seconds}s.")
  end

  def execute_core(request)
    apply_proxy if proxy?
    
    notify_requesting request
  
    reply = RestClient::Request.execute(opts_for(request))

    notify :replied, reply
    
    T::Response.new(reply.code, reply.headers, reply)
  end
  
  def opts_for(request)
    {
      :method     => request.verb, 
      :url        => request.uri.to_s, 
      :headers    => request.headers, 
      :payload    => request.body ? request.body.to_hash : nil, 
      :timeout    => request_timeout_in_seconds,
      :multipart  => request.body && request.body.respond_to?(:files)
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