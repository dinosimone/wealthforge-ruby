
class WealthForge::Offering

  def self.create(params)
    WealthForge::Connection.post 'offering/setup', params
  end

end
