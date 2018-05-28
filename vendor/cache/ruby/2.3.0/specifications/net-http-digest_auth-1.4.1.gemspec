# -*- encoding: utf-8 -*-
# stub: net-http-digest_auth 1.4.1 ruby lib

Gem::Specification.new do |s|
  s.name = "net-http-digest_auth"
  s.version = "1.4.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Eric Hodel"]
  s.cert_chain = ["-----BEGIN CERTIFICATE-----\nMIIDNjCCAh6gAwIBAgIBBDANBgkqhkiG9w0BAQUFADBBMRAwDgYDVQQDDAdkcmJy\nYWluMRgwFgYKCZImiZPyLGQBGRYIc2VnbWVudDcxEzARBgoJkiaJk/IsZAEZFgNu\nZXQwHhcNMTYxMDA1MDQyNTQ0WhcNMTcxMDA1MDQyNTQ0WjBBMRAwDgYDVQQDDAdk\ncmJyYWluMRgwFgYKCZImiZPyLGQBGRYIc2VnbWVudDcxEzARBgoJkiaJk/IsZAEZ\nFgNuZXQwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCbbgLrGLGIDE76\nLV/cvxdEzCuYuS3oG9PrSZnuDweySUfdp/so0cDq+j8bqy6OzZSw07gdjwFMSd6J\nU5ddZCVywn5nnAQ+Ui7jMW54CYt5/H6f2US6U0hQOjJR6cpfiymgxGdfyTiVcvTm\nGj/okWrQl0NjYOYBpDi+9PPmaH2RmLJu0dB/NylsDnW5j6yN1BEI8MfJRR+HRKZY\nmUtgzBwF1V4KIZQ8EuL6I/nHVu07i6IkrpAgxpXUfdJQJi0oZAqXurAV3yTxkFwd\ng62YrrW26mDe+pZBzR6bpLE+PmXCzz7UxUq3AE0gPHbiMXie3EFE0oxnsU3lIduh\nsCANiQ8BAgMBAAGjOTA3MAkGA1UdEwQCMAAwCwYDVR0PBAQDAgSwMB0GA1UdDgQW\nBBS5k4Z75VSpdM0AclG2UvzFA/VW5DANBgkqhkiG9w0BAQUFAAOCAQEAFz46xasn\n5Jx0lPqq6EGpijLIWv+jk+m2v3Ps38M2ZmNpiThmYFBHIqfDCS0UJWDPTj6FJX0A\nrspSuifsHq3CQ3RJImdO9Gewvx6p3WL/xZD1LmuRo6ktWH9gZWiZpA38GfFGj3SZ\n2u6n3qOEsaxIfwYcU4lCgeZ61JdVU+WWK+GfZpCz4BnjA5hgwdFaf5Zb560RtW7S\n77pi/SZtblyK/jqz1hgoMcaYZvIJTqZnen0pHaq+lKY1KzGdTuVbwD3DO+Fi1Vu8\nBOJAX2VNKk4wthxdCu0SvPe7e+QMP2rmaZOyuX4ztiDQiGuoJxyeqoG1WiOttINU\nU76tHMFuL0FUYw==\n-----END CERTIFICATE-----\n"]
  s.date = "2017-02-08"
  s.description = "An implementation of RFC 2617 - Digest Access Authentication.  At this time\nthe gem does not drop in to Net::HTTP and can be used for with other HTTP\nclients.\n\nIn order to use net-http-digest_auth you'll need to perform some request\nwrangling on your own.  See the class documentation at Net::HTTP::DigestAuth\nfor an example."
  s.email = ["drbrain@segment7.net"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.txt"]
  s.files = ["History.txt", "Manifest.txt", "README.txt"]
  s.homepage = "http://github.com/drbrain/net-http-digest_auth"
  s.licenses = ["MIT"]
  s.rdoc_options = ["--main", "README.txt"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.7")
  s.rubygems_version = "2.5.2.1"
  s.summary = "An implementation of RFC 2617 - Digest Access Authentication"

  s.installed_by_version = "2.5.2.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<minitest>, ["~> 5.8"])
      s.add_development_dependency(%q<rdoc>, ["~> 4.0"])
      s.add_development_dependency(%q<hoe>, ["~> 3.15"])
    else
      s.add_dependency(%q<minitest>, ["~> 5.8"])
      s.add_dependency(%q<rdoc>, ["~> 4.0"])
      s.add_dependency(%q<hoe>, ["~> 3.15"])
    end
  else
    s.add_dependency(%q<minitest>, ["~> 5.8"])
    s.add_dependency(%q<rdoc>, ["~> 4.0"])
    s.add_dependency(%q<hoe>, ["~> 3.15"])
  end
end
