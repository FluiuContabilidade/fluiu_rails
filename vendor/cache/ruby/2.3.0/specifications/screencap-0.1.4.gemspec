# -*- encoding: utf-8 -*-
# stub: screencap 0.1.4 ruby lib

Gem::Specification.new do |s|
  s.name = "screencap"
  s.version = "0.1.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Maxwell Salzberg", "David Spurr"]
  s.date = "2015-07-19"
  s.description = "a gem to grab screenshots of webpages, or just parts of webpages"
  s.email = ["maxwell@joindiaspora.com"]
  s.homepage = "http://github.com/maxwell/screencap"
  s.rubygems_version = "2.5.2.1"
  s.summary = "uses Phantom.js to grab pages, or parts of pages. Simple API."

  s.installed_by_version = "2.5.2.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, ["~> 2.10"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<phantomjs.rb>, [">= 0"])
      s.add_development_dependency(%q<fastimage>, [">= 0"])
      s.add_runtime_dependency(%q<phantomjs>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, ["~> 2.10"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<phantomjs.rb>, [">= 0"])
      s.add_dependency(%q<fastimage>, [">= 0"])
      s.add_dependency(%q<phantomjs>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, ["~> 2.10"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<phantomjs.rb>, [">= 0"])
    s.add_dependency(%q<fastimage>, [">= 0"])
    s.add_dependency(%q<phantomjs>, [">= 0"])
  end
end
