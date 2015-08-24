# Exhaust

Exhaust makes smoke testing a Ember/Rails stack easy.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'exhaust'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install exhaust

## Usage

1. Create a .exhaust.yml

```yaml
rails:
  path: "/path/to/rails"
  port: 3001
ember:
  path: "/path/to/ember"
  port: 4201
```

2. Start the servers
```ruby
Exhaust.run!
```

3. Stop the servers
```ruby
Exhaust.shutdown!
```

### Using with Cucumber
```ruby
# Add to features/support/env.rb
Exhaust.run!
at_exit { Exhaust.shutdown! }

Capybara.configure do |config|
  config.run_server = false
  config.app_host = Exhaust.ember_host
end
```

### Using with Rspec
```ruby
# Add to spec/spec_helper.rb
Exhaust.run!
at_exit { Exhaust.shutdown! }

Capybara.configure do |config|
  config.run_server = false
  config.app_host = Exhaust.ember_host
end
```

Of if you prefer

```ruby
# Add to spec/spec_helper.rb
before(:all) { Exhaust.run! }
after(:all) { Exhaust.shutdown! }

Capybara.configure do |config|
  config.run_server = false
  config.app_host = Exhaust.ember_host
end
```

### NOTE:
When using outside of the rails environment you will need to manually require the rails environment.

```ruby
ENV['RAILS_ENV'] ||= 'test'
path_to_rails = "/your/rails/path"
require File.expand_path("#{path_to_rails}/config/environment")
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mwoods79/exhaust.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

