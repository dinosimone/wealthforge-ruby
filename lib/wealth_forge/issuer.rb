
class WealthForge::Issuer

  def self.get_issuers
    WealthForge::Connection.get "issuer", nil
  end

  def self.create_issuer(params = {})
    WealthForge::Connection.post "issuer", params
  end

  def self.get_issuer(issuer_id)
    WealthForge::Connection.get "issuer/#{issuer_id}", nil
  end

  def self.update_issuer(params = {}, issuer_id)
    WealthForge::Connection.post "issuer/#{issuer_id}", params
  end

  def self.get_issuer_accounts(issuer_id)
    WealthForge::Connection.get "issuer/#{issuer_id}/accounts", nil
  end

  def self.create_issuer_account(params = {}, issuer_id)
    WealthForge::Connection.post "issuer/#{issuer_id}/accounts", params
  end

  def self.update_issuer_account(params, issuer_id, account_id)
    WealthForge::Connection.put "issuer/#{issuer_id}/accounts/#{account_id}", params
  end

end
