# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hyperledger_cli/version'

Gem::Specification.new do |spec|
  spec.name          = "hyperledger_cli"
  spec.version       = HyperledgerCli::VERSION
  spec.authors       = ["Daniel Feichtinger"]
  spec.email         = ["df@hyperledger.org"]
  spec.summary       = "A sample CLI for the Hyperledger protocol."
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.3"
  spec.add_runtime_dependency "rest_client", "~> 1.7"
  spec.add_runtime_dependency "thor", "~> 0.19"
end
