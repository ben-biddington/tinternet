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
      end
    end
  end
  
  it "can connect" do
    reply = internet.execute T::Request.new :uri => "https://go.xero.com"
    expect(reply.code).to eql 200
  end
  
  it "fails when host cannot be found" do
    expect{internet.execute(T::Request.new :uri => "http://a.com/")}.to raise_error /No such host/
  end 
end 