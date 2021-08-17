# frozen_string_literal: true

require 'active_support/security_utils'

module Rack
  class AuthorisedProxy
    VERSION = '1.0.0'

    def initialize(app, options = {})
      @app = app
      @expected_token = options.fetch(:expected_token, ENV.fetch('PROXY_TOKEN', nil))
      @header_name = options.fetch(:header_name, 'HTTP_X_PROXY_TOKEN').gsub('-', '_').upcase
      @not_allowed = options.fetch(:not_allowed, proc { |env| [403, {}, ['403 Forbidden']] })
    end

    def call(env)
      unless @expected_token.nil? || ActiveSupport::SecurityUtils.secure_compare(@expected_token, env.fetch(@header_name, ''))
        return @not_allowed.call(env)
      end

      @app.call(env)
    end
  end
end
