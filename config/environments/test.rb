Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # The test environment is used exclusively to run your application's
  # test suite. You never need to work with it otherwise. Remember that
  # your test database is "scratch space" for the test suite and is wiped
  # and recreated between test runs. Don't rely on the data there!
  config.cache_classes = true

  # Do not eager load code on boot. This avoids loading your whole application
  # just for the purpose of running a single test. If you are using a tool that
  # preloads Rails for running tests, you may have to set it to true.
  config.eager_load = false

  # Configure public file server for tests with Cache-Control for performance.
  config.public_file_server.enabled = true
  config.public_file_server.headers = {
    'Cache-Control' => "public, max-age=#{1.hour.seconds.to_i}"
  }

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Raise exceptions instead of rendering exception templates.
  config.action_dispatch.show_exceptions = false

  # Disable request forgery protection in test environment.
  config.action_controller.allow_forgery_protection = false
  config.action_mailer.perform_caching = false

  # Tell Action Mailer not to deliver emails to the real world.
  # The :test delivery method accumulates sent emails in the
  # ActionMailer::Base.deliveries array.

  config.action_mailer.delivery_method = :test
  # config.action_mailer.smtp_settings = { :host => "localhost", :port => 1025 }

  # Print deprecation notices to the stderr.
  config.active_support.deprecation = :stderr
  Rails.application.secrets.secret_key_base = '3248681aff49c99ea37b335089e2db86dca78a26114b727322fb1e99f68998eb64e684bc1989d2c5b35c1ca8f1145f40c0254a857acfe0f00d66be7f995efa75'
  # $AWS_ACCESS_KEY = ENV['AWS_ACCESS_KEY']
  # $AWS_SECRET_KEY= ENV['AWS_SECRET_KEY']
  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true
end
