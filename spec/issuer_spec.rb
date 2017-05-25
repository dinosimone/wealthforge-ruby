require "spec_helper"

describe WealthForge::Issuer do

  context 'issuer' do

    it "get issuers" do
      VCR.use_cassette 'get_issuers', record: :none do
        response = WealthForge::Issuer.all
        expect(response[:data].size).to be > 0
        expect(response[:errors].length).to eq 0	
      end
    end


    it "create issuer" do
      VCR.use_cassette 'create_issuer', record: :none do
        params = {
          address: "124 Investor Way",
          city: "Boston",
          state: "MA",
          zip: "02139",
          country: "US",
          bus_name: "LexShares",
          accounting_firm: "Accountants, LLC",
          founder_name: "James Smith",
          state_of_formation: "MA",
          entity_type: "ENTITY_TYPE_LLC",
          founder_title: "CEO",
          date_of_formation: "2001-11-01",
          ein: "999999999",
          email: "wealthforge_api_test@mailinator.com",
          phone: "2125551234",
          bus_logo: "http://unews.utah.edu/wp-content/uploads/Cash.jpg"
        }
        response = WealthForge::Issuer.create params
        expect(response[:errors].length).to eq 0
      end
    end

    
    it "get issuer" do
      VCR.use_cassette 'get_issuer', record: :all do
        response = WealthForge::Issuer.get "cc8033ee-cbd9-41b3-a02b-d4aa922a9829"
        expect(response[:data].size).to be > 0
        expect(response[:errors].length).to eq 0
      end
    end
    

    it "knowledge type list" do
      skip "Not yet implemented"
    end


    it "create knowledge type" do
      skip "Not yet implemented"
    end


    it "get tax transcript" do
      skip "Not yet implemented"
    end


    it "update tax transcript" do
      skip "Not yet implemented"
    end


    it "accreditation files list" do
      skip "Not yet implemented"
    end


    it "update accreditation files" do
      skip "Not yet implemented"
    end


    it "verify identity" do
      skip "Not yet implemented"
    end


    it "verify accreditation" do
      skip "Not yet implemented"
    end


  end

end
