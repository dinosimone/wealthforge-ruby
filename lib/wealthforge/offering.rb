class WealthForge::Offering

  def self.create(params)
    WealthForge::Connection.post 'offerings', params
  end

end
