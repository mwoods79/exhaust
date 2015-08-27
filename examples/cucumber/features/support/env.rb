ENV['RAILS_ENV'] ||= 'test'
path_to_rails = "../../spec/fixtures/rails_example"
require File.expand_path("#{path_to_rails}/config/environment")

require 'capybara/cucumber'

begin
  require 'database_cleaner'
  require 'database_cleaner/cucumber'

  DatabaseCleaner.strategy = :truncation
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

Exhaust.run!
at_exit { Exhaust.shutdown! }

Capybara.configure do |config|
  config.default_driver = :webkit
  config.app_host = Exhaust.ember_host
end
