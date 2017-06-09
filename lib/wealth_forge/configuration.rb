
module WealthForge
  class Configuration

    attr_accessor :wf_crt
    attr_accessor :wf_key
    attr_accessor :environment

    def initialize
      @wf_crt      = nil
      @wf_key      = nil
      @environment = "production"
    end

  end
end
