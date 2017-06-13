
class WealthForge::Offering

  def self.all
    WealthForge::Connection.get "offering", nil
  end


  def self.create(params)
    WealthForge::Connection.post 'offering/setup', params
  end


  def self.get(offering_id)
    WealthForge::Connection.get "offering/#{offering_id}", nil
  end  

end
