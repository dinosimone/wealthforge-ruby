require "spec_helper"

describe WealthForge::Offering do

  context 'offering' do

    before do
      WealthForge.configure do |config|
        config.wf_crt      = ENV['WF_CRT_FILE']
        config.wf_key      = ENV['WF_KEY_FILE']
        config.environment = 'development'
      end
    end


    it "create offering" do
      params = {
        max_raise: 123000,
        min_raise: 15000,
        date_start: "2018-01-01",
        date_end: "2019-11-01",
        issuer: "4056d199-53e1-4503-b963-be295bd8f135",
        offerDetails: [
          {
            issued: 250,
            offerDetailType: "EQUITY",
            instrumentType: "SHARE_COMMON",
            regulationType: "EXEMPTION_506C",
            minInvestment: 2500
          }
        ]
      }
      VCR.use_cassette 'create_offering', record: :none do
        response = WealthForge::Offering.create params
        expect(response[:errors].length).to eq 0	
      end
    end


    it "get list of offerings" do
      skip "Not yet implemented"
    end


    it "get offering" do
      skip "Not yet implemented"
    end


    it "update offering" do
      skip "Not yet implemented"
    end


    it "get redirect URL" do
      skip "Not yet implemented"
    end


    it "get offering status" do
      skip "Not yet implemented"
    end


    it "get offering account" do
      skip "Not yet implemented"
    end


    it "update offering account" do
      skip "Not yet implemented"
    end

    it "request offering approval" do
      skip "Not yet implemented"
    end


    it "offering due diligence file" do
      skip "Not yet implemented"
    end

    it "offering due diligence folder" do
      skip "Not yet implemented"
    end


    it "create offering escrow" do
      skip "Not yet implemented"
    end


    it "update offering escrow" do
      skip "Not yet implemented"
    end


    it "offering investments" do
      skip "Not yet implemented"
    end


    it "offering details" do
      skip "Not yet implemented"
    end


    it "update offering detail" do
      skip "Not yet implemented"
    end


    it "offering list of memos" do
      skip "Not yet implemented"
    end


    it "create/replace offering memo" do
      skip "Not yet implemented"
    end


    it "offering placement agreement" do
      skip "Not yet implemented"
    end


    it "create/replace offering placement agreement" do
      skip "Not yet implemented"
    end


    it "get offering tri-party escrow" do
      skip "Not yet implemented"
    end


    it "create/replace offering escrow agreement" do
      skip "Not yet implemented"
    end


    it "get offering w-9" do
      skip "Not yet implemented"
    end


    it "create/replace offering w-9" do
      skip "Not yet implemented"
    end


  end

end
