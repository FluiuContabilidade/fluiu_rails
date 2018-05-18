# -*- encoding: utf-8 -*-
# stub: watir 5.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "watir"
  s.version = "5.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Bret Pettichord"]
  s.date = "2013-10-05"
  s.description = "Automated testing tool for web applications. By Testers. For Testers."
  s.email = ["bret@pettichord.com"]
  s.homepage = "http://github.com/watir/watir"
  s.rubyforge_project = "watir"
  s.rubygems_version = "2.5.2.1"
  s.summary = "Watir"

  s.installed_by_version = "2.5.2.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<commonwatir>, ["~> 4"])
      s.add_runtime_dependency(%q<watir-webdriver>, [">= 0"])
    else
      s.add_dependency(%q<commonwatir>, ["~> 4"])
      s.add_dependency(%q<watir-webdriver>, [">= 0"])
    end
  else
    s.add_dependency(%q<commonwatir>, ["~> 4"])
    s.add_dependency(%q<watir-webdriver>, [">= 0"])
  end
end