$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "exhaust/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "exhaust"
  s.version     = Exhaust::VERSION
  s.authors     = ["Micah Woods"]
  s.email       = ["micahwoods@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Exhaust."
  s.description = "TODO: Description of Exhaust."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.3"

  s.add_development_dependency "sqlite3"
end
