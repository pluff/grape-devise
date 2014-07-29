# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'grape/devise/version'

Gem::Specification.new do |spec|
  spec.name = "grape-devise"
  spec.version = Grape::Devise::VERSION
  spec.authors = ["Pavel Shutsin"]
  spec.email = ["publicshady@gmail.com"]
  spec.summary = %q{This gem attempts to integrate Devise into Grape.}
  spec.description = %q{This gem attempts to provide Devise integration into Grape in native Grape way}
  spec.homepage = "https://github.com/pluff/grape-devise"
  spec.license = "MIT"

  spec.files = `git ls-files -z`.split("\x0")
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "grape", "> 0.7"
  spec.add_dependency "devise", "> 3.2"
  spec.add_dependency "active_support", ">= 3.2.6", "< 5"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
