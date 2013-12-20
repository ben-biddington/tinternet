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
  gem.name = "tinternet"
  gem.homepage = "http://github.com/ben-biddington/tinternet"
  gem.license = "MIT"
  gem.summary = %Q{The internet}
  gem.description = %Q{The internet}
  gem.email = "ben.biddington@xero.com"
  gem.authors = ["Ben Biddington"]
  # dependencies defined in Gemfile
end

Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core/rake_task'

desc "Run all the tests"
RSpec::Core::RakeTask.new(:test) do |t|
  t.pattern = "spec/**/_spec.rb"
end

task :default => :test
