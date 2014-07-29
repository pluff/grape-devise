# Grape::Devise

This gem attempts to integrate Devise into Grape in native Grape fashion.
Devise has great model modules, warden strategies etc so it's really tempts to use it when building APIs.
However devise controller layer doesn't fit well with Grape. Here where `grape-devise` comes to the rescue.

Gem benifits:

* native Grape integration
* ready-to-use set of helpers as well-known `current_user`

## Installation

Add this line to your application's Gemfile:

    gem 'grape-devise'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install grape-devise

## Usage

1. First of all you need to setup devise as usual. See ( https://github.com/plataformatec/devise#getting-started )
1. Add `Grape::Devise::Helpers` helpers and include `Grape::Devise::Endpoints` module into your API endpoints class e.g.

```

class MyApi < Grape::API
  helpers Grape::Devise::Helpers
  
  include Grape::Devise::Endpoints
end
```
1. Remove Devise routes from `routes.rb` file. We will use Grape-styled endpoints for our API, not default Rails routes.
1. Add `Devise.add_mapping(:users, {})` to your `devise.rb` initializer. Consider replacing `:users` with appropriate symbol of your devise resource.
1. Restart your server
 
## TODO

* Add support for every Devise module. Currently we have endpoints only for `:database_authenticatable`
* Create Rails generator
* Improve test coverage

## Contributing

1. Fork it ( https://github.com/pluff/grape-devise/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
