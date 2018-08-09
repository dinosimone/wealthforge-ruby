class WealthForge::Issuer

  def self.create(params)
    WealthForge::Connection.post 'issuers', params
  end

end 
