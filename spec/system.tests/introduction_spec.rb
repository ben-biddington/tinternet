require "spec_helper"
require "t"

describe "The basics" do
  it "can connect" do
    internet = T::Internet.new
		reply = internet.execute T::Request.new :uri => "https://go.xero.com"
		expect(reply.code).to eql 200
  end
end	 