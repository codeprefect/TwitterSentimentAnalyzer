# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'andelatsa/version'

Gem::Specification.new do |spec|
  spec.name          = "andelatsa"
  spec.version       = Andelatsa::VERSION
  spec.authors       = ["mubarakadeimam"]
  spec.email         = ["mubarakadeimam@yahoo.com"]

  spec.summary       = "A twitter sentiment analysis tool"
  spec.homepage      = "http://github.com/mubarakadeimam"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "oauth"
  spec.add_development_dependency "json"
  spec.add_development_dependency "date"
  spec.add_development_dependency "rubygems"
end
