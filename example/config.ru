require 'rack'
require 'rack/lobster'
require '../lib/rack_authorised_proxy'

use Rack::AuthorisedProxy

run Rack::Lobster.new
