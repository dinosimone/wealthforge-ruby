
class WealthForge::Investor

  def self.offering_list
    WealthForge::Connection.get "offering", nil
  end

end
