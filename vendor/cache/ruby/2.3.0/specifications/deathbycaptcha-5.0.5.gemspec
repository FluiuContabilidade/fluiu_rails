# -*- encoding: utf-8 -*-
# stub: deathbycaptcha 5.0.5 ruby lib

Gem::Specification.new do |s|
  s.name = "deathbycaptcha"
  s.version = "5.0.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Rafael Barbolo, Rafael Ivan Garcia"]
  s.date = "2017-02-07"
  s.description = "DeathByCaptcha allows you to solve captchas with manual labor"
  s.email = ["team@infosimples.com.br"]
  s.homepage = "https://github.com/infosimples/deathbycaptcha"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.2.1"
  s.summary = "Ruby API for DeathByCaptcha (Captcha Solver as a Service)"

  s.installed_by_version = "2.5.2.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.7"])
      s.add_development_dependency(%q<rake>, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>, ["~> 3.1"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.7"])
      s.add_dependency(%q<rake>, ["~> 10.0"])
      s.add_dependency(%q<rspec>, ["~> 3.1"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.7"])
    s.add_dependency(%q<rake>, ["~> 10.0"])
    s.add_dependency(%q<rspec>, ["~> 3.1"])
  end
end
