ENV['RAILS_ENV'] ||= 'test'
path_to_rails = "/Users/mwoods/hashrocket/example_todo"
require File.expand_path("#{path_to_rails}/config/environment")

require 'capybara/cucumber'

begin
  require 'database_cleaner'
  require 'database_cleaner/cucumber'

  DatabaseCleaner.strategy = :truncation
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

Around do |scenario, block|
  DatabaseCleaner.cleaning(&block)
end

Exhaust.run!
at_exit { Exhaust.shutdown! }

Capybara.configure do |config|
  config.default_driver = :webkit
  config.app_host = Exhaust.ember_host
end
