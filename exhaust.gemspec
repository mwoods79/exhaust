# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'exhaust/version'

Gem::Specification.new do |spec|
  spec.name          = "exhaust"
  spec.version       = Exhaust::VERSION
  spec.authors       = ["Micah Woods"]
  spec.email         = ["micahwoods@gmail.com"]

  spec.summary       = %q{Exhaust makes smoke testing a Ember/Rails stack easy.}
  spec.description   = %q{Love Ember? Love Rails? Want end-to-end tests? You're found the right place!}
  spec.homepage      = "https://github.com/mwoods79/exhaust"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
