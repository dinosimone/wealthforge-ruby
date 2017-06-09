# WealthForge API Client for Ruby

The WealthForge API acts as a connection between WealthForge's back-end transaction engine, CapitalForge, and your front-end website. This client seamlessly integrates into your Ruby application to provide an interface to the WealthForge API web service.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'wealth_forge'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install wealth_forge


## Configuration

Before you can use this gem, you'll need to configure it with the key and cert, which you'll have after registering with WealthForge. If using with Rails, put this code in the initializer.


    WealthForge.configure do |config|
      config.wf_crt_file = ENV['WF_CRT_FILE']
      config.wf_key_file = ENV['WF_KEY_FILE']
      config.environment = 'development'
    end

    or

    WealthForge.configure do |config|
      config.wf_crt = ENV['WF_CRT']
      config.wf_key = ENV['WF_KEY']
      config.environment = 'development'
    end



## Usage

Please refer to the official WealthForge API [documentation](https://api.wealthforge.com/) for a full list of API calls. Note that this is currently a partial implementation of the most commonly used functionality.


### Available Calls

#### Investor

    WealthForge::Investor.all
    WealthForge::Investor.create params
    WealthForge::Investor.get investor_id
    WealthForge::Investor.update investor_id, params
    WealthForge::Investor.accreditation_evidence investor_id, params
    
#### Investment

    WealthForge::Investment.all
    WealthForge::Investment.create params
    WealthForge::Investment.get investment_id
    WealthForge::Investment.update investment_id, params
    WealthForge::Investment.redirect_url investment_id
    WealthForge::Investment.status investment_id
    WealthForge::Investment.account investment_id
    WealthForge::Investment.update_account investment_id, account
    WealthForge::Investment.approve investment_id
    WealthForge::Investment.approve_subscription investment_id
    WealthForge::Investment.due_diligence investment_id
    WealthForge::Investment.create_subscription_agreement investment_id, params

#### Issuer

    WealthForge::Issuer.all
    WealthForge::Issuer.create params
    WealthForge::Issuer.get id

#### Offering

    WealthForge::Offering.create params



## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dinosimone/wealth_forge.


## Tests

All tests can be run by typing `rspec`. Prior to running tests, you'll need to export your cert and key as such:

    export WF_CRT_FILE=/home/you/wealthforge/certs/development.crt
    export WF_KEY_FILE=/home/you/wealthforge/certs/development.key


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


## Disclaimer

This project and the code therein was not created by and is not supported by WealthForge.


## Author

Dino Simone (dino@simone.is)
