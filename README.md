# WealthForge API Client for Ruby

The WealthForge API acts as a connection between WealthForge's back-end transaction engine, CapitalForge, and your front-end website. This API client is responsible for interfacing with the WealthForge API.


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

Before you can use this gem, you'll need to configure it with the key and cert. If using with Rails, put this code in the initializer.


    WealthForge.configure do |config|
      config.wf_crt      = ENV['WF_CRT_FILE']
      config.wf_key      = ENV['WF_KEY_FILE']
      config.environment = 'development'
    end



## Usage

Please refer to the official WealthForge API [documentation](https://api.wealthforge.com/) for a full list of API calls. Note that this is currently a partial implementation of the most commonly used functionality.


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dinosimone/wealth_forge.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

