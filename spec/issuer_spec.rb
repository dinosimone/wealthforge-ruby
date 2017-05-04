require "spec_helper"

describe WealthForge::Issuer do

  context 'issuer' do

    it "get issuers" do
      VCR.use_cassette 'get_issuers', record: :all do
        response = WealthForge::Issuer.get_issuers
        puts response.inspect
        #expect(response[:errors].length).to eq 0
      end
    end

  end

end
