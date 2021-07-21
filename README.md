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

    $ gem install wealthforge-ruby


## Configuration

Before you can use this gem, you'll need to configure it with the key and cert, which you'll have after registering with WealthForge. If using with Rails, put this code in the initializer.

```ruby
WealthForge.configure do |config|
  config.client_secret = ENV['WF_CLIENT_SECRET']
  config.client_id     = ENV['WF_CLIENT_ID']
  config.environment = 'development'
end
```

## Usage

Please refer to the official WealthForge API [documentation](https://wealthforge.api-docs.io/) for a full list of API calls. Note that this is currently a partial implementation of the most commonly used functionality.


### Available Calls

#### Investment

```ruby
WealthForge::Investment.create params
WealthForge::Investment.get investment_id
WealthForge::Investment.file_upload path, mime_type, title, subscription_id
```

#### Issuer

```ruby
WealthForge::Issuer.create params
```

#### Offering

```ruby
WealthForge::Offering.create params
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dinosimone/wealthforge-ruby.


## Tests

All tests can be run by typing `rspec`. Prior to running tests, you'll need to export your cert and key as such:

    export WF_CLIENT_SECRET=[secret]
    export WF_CLIENT_ID=[client-id]


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


## Disclaimer

This project and the code therein was not created by and is not supported by WealthForge.


## Author

Dino Simone (dino@simone.is) | dinosimone.com
