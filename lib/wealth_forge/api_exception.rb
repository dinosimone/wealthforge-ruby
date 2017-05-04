class WealthForge::ApiException < StandardError
  def initialize(e = nil)
    super e
    set_backtrace e.backtrace if e
  end
end
