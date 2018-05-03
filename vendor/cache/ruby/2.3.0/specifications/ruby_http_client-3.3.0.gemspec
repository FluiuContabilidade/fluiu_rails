# -*- encoding: utf-8 -*-
# stub: ruby_http_client 3.3.0 ruby lib

Gem::Specification.new do |s|
  s.name = "ruby_http_client"
  s.version = "3.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Elmer Thomas"]
  s.date = "2017-10-30"
  s.description = "Quickly and easily access any REST or REST-like API."
  s.email = "dx@sendgrid.com"
  s.homepage = "http://github.com/sendgrid/ruby-http-client"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.2.1"
  s.summary = "A simple REST client"

  s.installed_by_version = "2.5.2.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>, ["~> 0"])
    else
      s.add_dependency(%q<rake>, ["~> 0"])
    end
  else
    s.add_dependency(%q<rake>, ["~> 0"])
  end
end