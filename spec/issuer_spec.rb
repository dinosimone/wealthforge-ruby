require 'spec_helper'

describe WealthForge::Issuer do

  context 'issuer' do

    before do
      WealthForge.configure do |config|
        config.client_secret = 'your-client-secret'
        config.client_id     = 'your-client-id'
        config.environment   = 'development'
      end
    end

    it 'create issuer' do
      VCR.use_cassette 'create_issuer', record: :none do
        params = {
          data: {
            attributes: {
              address: {
                city: 'Boston',
                country: 'US',
                postalCode: '02139',
                stateProv: 'MA',
                street1: '323 Congress Street',
                street2: nil
              },
              bank: 'Bank of America',
              contact: {
                emailAddress: 'test.guy@test.com',
                firstName: 'Test',
                lastName: 'Guy',
                phoneNumber: '111-222-3333',
                title: 'CEO'
              },
              ein: '123456789',
              entityType: 'LLC',
              name: 'Kingdom Holdings, LLC',
              organizationType: 'ISSUER',
              phoneNumber: '111-222-3333',
              stateOfIncorporation: 'MA',
              sponsorID: nil
            },
            type: 'issuer'
          }
        }
        response = WealthForge::Issuer.create params
        expect(response['data']['id']).not_to be_nil
      end
    end

  end

end
