# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

require 'rake'
require 'jeweler'

Jeweler::Tasks.new do |gem|
  gem.name = "t"
  gem.homepage = "http://github.com/ben-biddington/t"
  gem.license = "MIT"
  gem.summary = %Q{The internet}
  gem.description = %Q{The internet}
  gem.email = "ben.biddington@xero.com"
  gem.authors = ["Ben Biddington"]
  # dependencies defined in Gemfile
end

Jeweler::RubygemsDotOrgTasks.new
