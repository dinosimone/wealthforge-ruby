# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wealthforge/version'

Gem::Specification.new do |spec|
  spec.name          = "wealthforge-ruby"
  spec.version       = WealthForge::VERSION
  spec.authors       = ["Dino Simone"]
  spec.email         = ["dino@simone.is"]

  spec.summary       = %q{WealthForge API Client}
  spec.description   = %q{The WealthForge API acts as a connection between WealthForge's back-end transaction engine, CapitalForge, and your front-end website. This client seamlessly integrates into your Ruby application to provide an interface to the WealthForge API web service.}
  spec.homepage      = "https://api.wealthforge.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "faraday", "~> 0.12.0.1"
  spec.add_runtime_dependency "mime-types", "~> 3.1"

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "vcr", "~> 3.0"
  spec.add_development_dependency "webmock", "~> 2.3"
  spec.add_development_dependency "factory_girl", "~> 4.0"

end
