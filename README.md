# RackAuthorisedProxy

Only permit requests that originate from an authorised reverse proxy

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rack_authorised_proxy', github: '12joan/rack_authorised_proxy'
```

And then execute:

    $ bundle install

## Usage

Add this line to your application's config.ru file:

```ruby
use Rack::AuthorisedProxy
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
