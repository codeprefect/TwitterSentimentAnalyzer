# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'andeltsa/version'

Gem::Specification.new do |spec|
  spec.name          = "andeltsa"
  spec.version       = Andeltsa::VERSION
  spec.authors       = "mubarakadeimam"
  spec.email         = "mubarakadeimam@yahoo.com"

  spec.summary       = "An Andela Bootcamp Project"
  spec.description   = "Carries out Tweets analysis using Alchemy Sentiment Analysis API"
  spec.homepage      = "https://github.com/mubarakadeimam/TwitterSentimentAnalyzer"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = ["andeltsa"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "oauth"
  spec.add_development_dependency "json"
  spec.add_development_dependency "colorize"
  spec.add_development_dependency "rubygems"
  spec.add_development_dependency "date"
end
