
class WealthForge::Investor

  def self.all
    WealthForge::Connection.get "investor", nil
  end


  def self.create(params)
    WealthForge::Connection.post "investor", params
  end


  def self.get(investor_id)
    WealthForge::Connection.get "investor/#{investor_id}", nil
  end


  def self.update(investor_id, params)
    WealthForge::Connection.put "investor/#{investor_id}", params
  end


  def self.accreditation_evidence(investor_id, params)
    mapped_params = {
      status: {code: 'FILE_INPROGRESS', active: true},
      mimeType: MIME::Types.type_for(params[:filename]).first.to_s,
      folder: {parentFolder: {code: 'DUE_DILIGENCE'}},
      fileName: params[:filename],
      displayTitle: params[:filename],
      content: Base64.strict_encode64(params[:file]),
      parent: params[:remote_investment]
    }
    WealthForge::Connection.put "investor/#{investor_id}/accreditationEvidence", mapped_params
  end

end
