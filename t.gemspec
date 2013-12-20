# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "t"
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ben Biddington"]
  s.date = "2013-12-20"
  s.description = "The internet"
  s.email = "ben.biddington@xero.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".document",
    ".travis.yml",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "lib/t.rb",
    "lib/t/adapters/rest_client_internet.rb",
    "lib/t/internet.rb",
    "lib/t/request.rb",
    "spec/spec_helper.rb",
    "spec/system.tests/introduction_spec.rb",
    "t.gemspec"
  ]
  s.homepage = "http://github.com/ben-biddington/t"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.28"
  s.summary = "The internet"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rest-client>, [">= 0"])
      s.add_runtime_dependency(%q<audible>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<rsettings>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.8.7"])
    else
      s.add_dependency(%q<rest-client>, [">= 0"])
      s.add_dependency(%q<audible>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<rsettings>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.8.7"])
    end
  else
    s.add_dependency(%q<rest-client>, [">= 0"])
    s.add_dependency(%q<audible>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<rsettings>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.8.7"])
  end
end
