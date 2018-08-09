module WealthForge

  class Configuration

    attr_accessor :client_id
    attr_accessor :client_secret
    attr_accessor :environment
    attr_accessor :api_url
    attr_accessor :token_url
    attr_accessor :version

    def initialize
      @client_id     = nil
      @client_secret = nil
      @api_url       = 'https://api.wealthforge.org/v1/'
      @token_url     = 'https://api.wealthforge.org/v1/auth/tokens'
      @environment   = 'development'
      @version       = 'v2'
    end

  end

end
