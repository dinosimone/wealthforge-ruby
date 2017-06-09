require "spec_helper"

describe WealthForge::Investor do

  context 'investor' do

    before do
      @investor_id = "007e8578-6841-4106-8fad-fb6ed64ed293"
       WealthForge.configure do |config|
        config.wf_crt_file = ENV['WF_CRT_FILE']
        config.wf_key_file = ENV['WF_KEY_FILE']
        config.environment = 'development'
      end 
    end

   
    it "get all investors" do
      VCR.use_cassette 'all_investors', record: :none do
        response = WealthForge::Investor.all
        expect(response[:data].size).to be > 0
        expect(response[:errors].length).to eq 0
      end
    end


    it "create investor" do
      params = {
        address: "123 Test Rd.",
        name: "API Investor",
        state: "VA",
        signature: "",
        country: "US",
        uid: nil,
        address2: nil,
        city: "Richmond",
        zip: "23229",
        investor_url: "http://fundroom.com/apitest",
        phone: "(804)-555-1234",
        tax_id: "112-22-3333",
        accredited: true,
        dob: "1942-07-04",
        email: "wealthforge_api_investor@fundroom.com",
        investment_timeline: "LESS_THAN_YEAR",
        accreditation: "INCOME",
        investment_risk: "AGGRESSIVE",
        investor_type: "INDIVIDUAL",
        logo: " https://cdn0.iconfinder.com/data/icons/Personal_loan-512.png",
        income: 10000000,
        net_worth: nil,
        accredited_other: nil,
        eligible_invest_amount: nil,
        status: "INVESTOR_ACTIVE",
        year_verified: ""        
      }
      VCR.use_cassette 'create_investor', record: :none do
        response = WealthForge::Investor.create params
        expect(response[:data][:id]).to be_truthy
        expect(response[:errors].length).to eq 0
      end
    end


    it "get investor" do
      VCR.use_cassette 'get_investor', record: :all do
        response = WealthForge::Investor.get @investor_id
        expect(response[:errors].length).to eq 0
	expect(response[:data][:id]).to eq @investor_id
      end
    end


    it "updates investor" do
      params = {
        name: "Updated Name"
      }
      VCR.use_cassette 'update_investor', record: :none do
        response = WealthForge::Investor.update @investor_id, params
        expect(response[:errors].length).to eq 0
	expect(response[:data][:name]).to eq "Updated Name"
      end
    end


    it "upload accreditation files" do
      params = {
        file: open("#{Dir.pwd}/spec/files/test_file.pdf") {|f| f.read},
        filename: "new-file.pdf",
        remote_investment: "0c0a726f-3094-4493-bf60-ce496c03f556",

      }
      VCR.use_cassette 'upload_accreditation_files', record: :none do
        response = WealthForge::Investor.accreditation_evidence "3f953ff5-58ca-4b12-ac61-67c0ea58d23f", params
        expect(response[:errors].length).to eq 0
        expect(response[:data][:status][:code]).to eq "FILE_INPROGRESS"
      end
    end


    it "get list of knowledge type" do
      skip "Not yet implemented"
    end

    it "create list of knowledge type" do
      skip "Not yet implemented"
    end

    it "get investor 4506T file" do
      skip "Not yet implemented"
    end

    it "update investor 4506T file" do
      skip "Not yet implemented"
    end

    it "get list of an investor accounts" do
      skip "Not yet implemented"
    end

    it "create investor account" do
      skip "Not yet implemented"
    end

    it "update investor account" do
      skip "Not yet implemented"
    end

    it "get list of accreditation files" do
      skip "Not yet implemented"
    end

    it "update list of accreditation files" do
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
