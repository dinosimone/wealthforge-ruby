class WealthForge::ApiException < StandardError
  def initialize(e = nil)
    puts "API error: #{e.inspect}"
    super e
    set_backtrace e.backtrace if e
  end
end
