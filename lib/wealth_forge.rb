require "wealth_forge/configuration"
require "wealth_forge/version"
require "wealth_forge/api_exception"
require "wealth_forge/connection"
require "wealth_forge/investment"
require "wealth_forge/investor"
require "wealth_forge/issuer"
require "wealth_forge/offering"

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
  end

end
