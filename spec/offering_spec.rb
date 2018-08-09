require 'spec_helper'

describe WealthForge::Offering do

  context 'offering' do

    before do
      WealthForge.configure do |config|
        config.client_secret = 'your-client-secret'
        config.client_id     = 'your-client-id'
        config.environment   = 'development'
      end
    end

    it 'create offering' do
      VCR.use_cassette 'create_offering', record: :none do
        params = {
          data: {
            attributes: {
              title: 'Company Name',
              issuerId: 'f953be04-06e5-462e-804f-29830cee69f5',
              offeringType: 'REG_D_506_C',
              startDate: '2018-01-03',
              endDate: '2019-01-01',
              minimumRaise: '5000.00',
              maximumRaise: '500000.00',
              minimumInvestment: '2500.00',
              paymentMethods: ['ACH', 'WIRE'],
              status: 'PENDING_REVIEW',
              securityTypes: [{
                type: 'COMMON_STOCK',
                securityPrice: '1.00',
                numSharesOffered: 1
              }]
            },
            type: 'offerings'
          }
        }
        response = WealthForge::Offering.create params
	expect(response['data']['id']).not_to be_nil
      end
    end

  end

end
