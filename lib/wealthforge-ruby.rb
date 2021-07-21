require "wealthforge/configuration"
require "wealthforge/api_exception"
require "wealthforge/connection"
require "wealthforge/investment"
require "wealthforge/issuer"
require "wealthforge/offering"

module WealthForge
  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
    configuration.api_url = configuration.environment == "production" ? configuration.production_url : configuration.sandbox_url
    configuration.token_url = "#{configuration.api_url}/auth/tokens"
  end
end
