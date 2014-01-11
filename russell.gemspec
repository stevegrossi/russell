# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'russell/version'

Gem::Specification.new do |spec|
  spec.name          = "russell"
  spec.version       = Russell::VERSION
  spec.authors       = ["Steve Grossi"]
  spec.email         = ["me@stevegrossi.com"]
  spec.summary       = %q{A ruby gem for deriving proofs with symbolic logic.}
  # spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = "http://github.com/stevegrossi/russell"
  # spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "citrus", "~> 2.4.1"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.14.1"
  spec.add_development_dependency "guard-rspec", "~> 4.2.4"
end
