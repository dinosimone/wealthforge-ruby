lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "wealthforge/version"

Gem::Specification.new do |spec|
  spec.name = "wealthforge-ruby"
  spec.version = WealthForge::VERSION
  spec.authors = ["Dino Simone | dinosimone.com"]
  spec.email = ["dino@simone.is"]

  spec.summary = "WealthForge API Client"
  spec.description = "The WealthForge API acts as a connection between WealthForge's back-end transaction engine, CapitalForge, and your front-end website."
  spec.homepage = "https://github.com/dinosimone/wealthforge-ruby"
  spec.license = "MIT"

  spec.files = Dir.glob("{bin,lib}/**/*") + %w[LICENSE README.md]
  spec.bindir = "bin"
  spec.executables = ["console", "setup"]
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "faraday", "~> 0.14.0"
  spec.add_runtime_dependency "mime-types", "~> 3.1"
  spec.add_runtime_dependency "jwt", "2.1.0"

  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "vcr", "~> 3.0"
  spec.add_development_dependency "webmock", "~> 2.3"
  spec.add_development_dependency "factory_girl", "~> 4.0"
end
