# -*- encoding: utf-8 -*-
# stub: imgkit 1.6.1 ruby lib

Gem::Specification.new do |s|
  s.name = "imgkit"
  s.version = "1.6.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["csquared"]
  s.date = "2015-05-21"
  s.description = "Uses wkhtmltoimage to create Images using HTML"
  s.email = "christopher.continanza@gmail.com"
  s.executables = ["imgkit"]
  s.files = ["bin/imgkit"]
  s.homepage = "http://rubygems.org/gems/imgkit"
  s.post_install_message = "******************************************************************\n\nNow install wkhtmltoimage binaries:\nGlobal: sudo `which imgkit` --install-wkhtmltoimage\n        rvmsudo imgkit --install-wkhtmltoimage\n(installs to default /usr/local/bin/wkhtmltoimage)\n\ninside RVM folder: export TO=`which imgkit | sed 's:/imgkit:/wkhtmltoimage:'` && imgkit --install-wkhtmltoimage\n(you'll have to configure the location of the binary if you do this!)\n\n(run imgkit --help to see more options)\n******************************************************************\n"
  s.rubyforge_project = "imgkit"
  s.rubygems_version = "2.5.2.1"
  s.summary = "HTML+CSS -> JPG"

  s.installed_by_version = "2.5.2.1" if s.respond_to? :installed_by_version
end
