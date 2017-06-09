# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wealth_forge/version'

Gem::Specification.new do |spec|
  spec.name          = "wealth_forge"
  spec.version       = WealthForge::VERSION
  spec.authors       = ["Dino Simone"]
  spec.email         = ["dino@simone.is"]

  spec.summary       = %q{WealthForge API Client}
  spec.description   = %q{WealthForge API Client}
  spec.homepage      = "https://api.wealthforge.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "faraday"
  spec.add_runtime_dependency "mime-types"

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "factory_girl", "~> 4.0"

end
