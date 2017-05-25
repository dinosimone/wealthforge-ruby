
class WealthForge::Issuer

  def self.all
    WealthForge::Connection.get "issuer", nil
  end

  def self.create(params = {})
    params[:country] = {code: params[:country]}
    params[:state_of_formation] = {code: params[:state_of_formation]}
    params[:entity_type] = {code: params[:entity_type]}
    WealthForge::Connection.post "issuer", params
  end

  def self.get(issuer_id)
    WealthForge::Connection.get "issuer/#{issuer_id}", nil
  end

  def self.update(params = {}, issuer_id)
    WealthForge::Connection.post "issuer/#{issuer_id}", params
  end

  def self.accounts(issuer_id)
    WealthForge::Connection.get "issuer/#{issuer_id}/accounts", nil
  end

  def self.create_account(params = {}, issuer_id)
    WealthForge::Connection.post "issuer/#{issuer_id}/accounts", params
  end

  def self.update_account(params, issuer_id, account_id)
    WealthForge::Connection.put "issuer/#{issuer_id}/accounts/#{account_id}", params
  end

end
