class WealthForge::Offering

  def self.create(params)
    WealthForge::Connection.post 'offerings', params
  end

  def self.get(offering_id)
    WealthForge::Connection.get "offerings/#{offering_id}", nil
  end

end
