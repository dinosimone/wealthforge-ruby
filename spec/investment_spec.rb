require "spec_helper"

describe WealthForge::Investment do
  context "investment" do
    before do
      WealthForge.configure do |config|
        config.client_secret = "your-client-secret"
        config.client_id = "your-client-id"
        config.environment = "development"
      end
    end

    it "get investment" do
      VCR.use_cassette "get_investment", record: :none do
        response = WealthForge::Investment.get "8ee6531d-7d15-43a5-8270-c111bc9d42f9"
        expect(response["data"]["id"]).not_to be_nil
        expect(response["data"]["type"]).to eq "subscriptions"
      end
    end

    it "upload file" do
      VCR.use_cassette "upload_file", record: :none do
        response = WealthForge::Investment.file_upload("#{Dir.pwd}/spec/files/test_file.pdf", "application/pdf", "test.pdf", "8ee6531d-7d15-43a5-8270-c111bc9d42f9")
        expect(response.size).to eq 1
        expect(response.first["fileName"]).to eq "test.pdf"
      end
    end

    it "create new investment" do
      VCR.use_cassette "create_investment", record: :none do
        params = {
          data: {
            attributes: {
              investors: [{
                accreditationType: "INCOME",
                address: {
                  city: "Boston",
                  country: "US",
                  postalCode: "02139",
                  stateProv: "MA",
                  street1: "40 Congress",
                  street2: nil
                },
                crdNumber: nil,
                dateOfBirth: "1980-02-03",
                emailAddress: "investor@test.com",
                firstName: "Tammy",
                investorType: "INDIVIDUAL",
                isPrimary: true,
                lastName: "Smith",
                name: "Entity Name",
                primaryPhone: "1221222222",
                ssn: "123456789",
                ein: "123456789",
                signatory: {
                  title: "CEO",
                  address: {
                    city: "Boston",
                    street1: "39 School Street",
                    street2: nil,
                    stateProv: "MA",
                    postalCode: "02139",
                    country: "US"
                  },
                  dateOfBirth: "01/01/1983",
                  lastName: "Smith",
                  firstName: "Bob",
                  signatoryAuthority: true,
                  ssn: "123456789"
                }
              }],
              fundingMethods: [
                {
                  accountFirstName: nil,
                  accountLastName: nil,
                  accountNumber: nil,
                  accountType: nil,
                  bankName: nil,
                  routingNumber: nil,
                  investmentAmount: "7500.00",
                  numberOfShares: nil,
                  numberOfNotes: nil,
                  paymentType: "WIRE"
                }
              ],
              investmentAmount: "7500.00",
              offeringId: "988fad9f-985b-44db-87a4-4aab4f5fd9cd",
              stash: {},
              suitabilityQuestions: [
                {
                  answerKeys: ["a"],
                  questionKey: "Experience"
                },
                {
                  answerKeys: ["a"],
                  questionKey: "Objective"
                },
                {
                  'answerKeys': ["a"],
                  'questionKey': "Tolerance"
                },
                {
                  answerKeys: ["a"],
                  questionKey: "Other Investments"
                }
              ]
            },
            type: "subscriptions"
          }
        }
        response = WealthForge::Investment.create params
        expect(response["data"]["id"]).not_to be_nil
        expect(response["data"]["attributes"]["investmentAmount"]).to eq "7500.00"
      end
    end
  end
end
