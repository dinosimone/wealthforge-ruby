
FactoryGirl.define do
  factory :investment do
    address              "123 Test Street"
    name                 "Dino Simone"
    state                "MA"
    signature            ""
    country              "US"
    uid                  nil
    address2             ""
    city                 "Cambridge"
    zip                  "02139"
    investorUrl          "http://fundroom.com/apitest"
    phone                "(804)-555-1234"
    taxId                "112-22-3333"
    accredited           true
    dob                  "1942-07-04"
    email                "wealthforge_api_investor@fundroom.com"
    investmentTimelin e  "LESS_THAN_YEAR"
    accreditation        "INCOME"
    investmentRisk       "AGGRESSIVE"
    investorType         "INDIVIDUAL"
    logo                 "https://cdn0.iconfinder.com/data/icons/Personal_loan-512.png"
    income               "10000000",
    netWorth             nil,
    accreditedOther      nil,
    eligibleInvestAmount nil,
    status               "INVESTOR_ACTIVE"
    yearVerified         ""  
  end
end
