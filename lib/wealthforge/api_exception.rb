require 'pp'

class WealthForge::ApiException < StandardError
  def initialize(e = nil)
    pp e
    super e
    set_backtrace e.backtrace if e
  end
end
