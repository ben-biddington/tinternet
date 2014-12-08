require "spec_helper"
require "t"
require "rsettings"

S = ::Settings.new do
  let "LOUD" => :loud; default :loud, :to => "no"
end

describe "The basics" do
  let(:internet) do 
    T::Internet.new.tap do |it|
      if S.loud?
        it.on :requesting do |e,args|
          puts "Requesting <#{args.first.uri}>"
        end
        
        it.on :progress do |e,args|
          puts "#{e} -- #{args}"
        end
      end
    end
  end
  
  it "can connect" do
    reply = internet.execute T::Request.new :uri => "https://go.xero.com"
    expect(reply.code).to eql 200
  end
  
  it "fails when host cannot be found" do
    expect{internet.execute(T::Request.new :uri => "http://a.com/")}.to raise_error SocketError
  end 
  
  it "can <application/x-www-form-urlencoded> post" do
    reply = internet.execute T::Request.new(
      :uri => "http://www.hashemian.com/tools/form-post-tester.php", 
      :verb => :post,
      :body => T::XWwwFormUrlencoded.new("name" => "Ben")
    )
    
    expect(reply.code).to eql 200
    expect(reply.body).to match /name=Ben/
  end
  
  it "can <multipart> post" do
    reply = internet.execute T::Request.new(
      :uri => "http://www.hashemian.com/tools/form-post-tester.php", 
      :verb => :post,
      :body => T::MultipartFormData.new({"name" => "Ben"}, {"README" => File.new("README.md", 'rb')})
    )
    
    expect(reply.code).to eql 200
    expect(reply.body).to match /name=Ben/
  end
end 