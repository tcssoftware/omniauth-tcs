require 'omniauth-oauth2'
# require "oauth2"
# require "omniauth"

module OmniAuth
  module Strategies
    class Tcs < OmniAuth::Strategies::OAuth2
      # include OmniAuth::Strategy
      option :name, 'tcs'
      option :use_https, true
      option :client_options, {
               site:            "https://associationdatabase.com",
               authorize_url:   "/oauth/authorize",
               token_url:       "/oauth/token"
             }

      def callback_url
         full_host + script_name + callback_path
      end

      def request_phase
        super
      end

      info do
        raw_info.merge("token" => access_token.token)
      end

      uid { raw_info["id"] }

      def raw_info
        @raw_info ||= access_token.get('/api/user').parsed
      end

      private
      def protocol
        options.use_https ? 'https' : 'http'
      end
    end
  end
end