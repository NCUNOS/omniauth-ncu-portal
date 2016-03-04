require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class NCUPortal < OmniAuth::Strategies::OAuth2
      DEFAULT_SCOPES = %w(identifier)
      HOST = 'portal3g.ncu.edu.tw'

      option :client_options, {
        :site => "https://#{HOST}",
        :authorize_url => "https://#{HOST}/oauth2/authorization",
        :token_url => "https://#{HOST}/oauth2/token"
      }

      option :token_params, {
        :parse => :json
      }

      option :authorize_params, {
        :scope => DEFAULT_SCOPES
      }

      def request_phase
        super
      end

      def authorize_params
        super.tap do |params|
          %w[scope client_options].each do |v|
            if request.params[v]
              params[v.to_sym] = request.params[v]
            end
          end
          params[:scope] = params[:scope].join ' ' if params[:scope]
        end
      end

      uid do
        info['id']
      end

      info do
        {
          'id' => raw_info['id']
        }
      end

      extra do
        {
          :raw_info => raw_info
        }
      end

      def raw_info
        access_token.options[:mode] = :header
        @raw_info ||= access_token.get('apis/oauth/v1/info').parsed
      rescue ::OAuth2::Error => e
        Logger.new(STDOUT).info e.to_s
        {}
      end
    end
  end
end

OmniAuth.config.add_camelization 'ncuportal', 'NCUPortal'
