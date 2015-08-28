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

1. Exhaust sets an ENV variable. Tell Ember how to use it.

```javascript
// config/environment.js
if (environment === 'development') {
  // Set the ENV.API_HOST to the environment varibale.
  // I like to set a default but it's all up to you.
  ENV.API_HOST = (process.env.API_HOST || 'http://localhost:3000')
}
```
If using Ember Data, set the host to whatever adapter

```javascript
// app/adapters/application.js
import DS from 'ember-data';
import config from '../config/environment';

export default DS.RESTAdapter.extend({
  host: config.API_HOST
});
```

If using Ember.$ reference wherever needed.
```javascript
import Ember from 'ember'
import config from '../config/environment';


Ember.$.getJSON(config.API_HOST + "/endpoint")
```

2. Create a .exhaust.yml

```yaml
rails:
  path: "/path/to/rails"
  port: 3001
ember:
  path: "/path/to/ember"
  port: 4201
```

3. Start the servers

```ruby
Exhaust.run!
```

4. Stop the servers
```ruby
Exhaust.shutdown!
```

### Using with Cucumber

When used insided a rails app.

```ruby
# Add to features/support/env.rb
Exhaust.run!
at_exit { Exhaust.shutdown! }

Capybara.configure do |config|
  config.run_server = false
  // Use whatever driver you want
  config.default_driver = :webkit
  config.app_host = Exhaust.ember_host
end
```

When seperatly from rails.

1. Add your rails app Gemfile to your own

```ruby
eval_gemfile File.join("/path/to/rails/Gemfile")
```

2. Do something like this in your features/support/env.rb

```ruby
ENV['RAILS_ENV'] ||= 'test'
path_to_rails = "/path/to/rails"
require File.expand_path("#{path_to_rails}/config/environment")

require 'capybara/cucumber'
require 'database_cleaner'
require 'database_cleaner/cucumber'

DatabaseCleaner.strategy = :truncation

Exhaust.run!
at_exit { Exhaust.shutdown! }

Capybara.configure do |config|
  // Use whatever driver you want
  config.default_driver = :webkit
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

