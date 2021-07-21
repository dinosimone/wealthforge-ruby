module WealthForge
  class Configuration
    attr_accessor :client_id
    attr_accessor :client_secret
    attr_accessor :environment
    attr_accessor :api_url
    attr_accessor :token_url
    attr_accessor :version
    attr_accessor :production_url
    attr_accessor :sandbox_url

    def initialize
      @client_id = nil
      @client_secret = nil
      @environment = nil
      @api_url = nil
      @token_url = nil
      @production_url = "https://api.wealthforge.com/v1"
      @sandbox_url = "https://api.wealthforge.org/v1"
      @version = "v1"
    end
  end
end
