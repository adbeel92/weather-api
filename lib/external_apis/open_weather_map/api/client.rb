# frozen_string_literal: true

require "external_apis/open_weather_map/api/connection"
require "external_apis/open_weather_map/api/request"

require "external_apis/open_weather_map/api/client/onecall"

module ExternalApis
  module OpenWeatherMap
    module Api
      class Client
        OAUTH_PROVIDER_SITE = 'https://api.openweathermap.org'

        attr_accessor :oauth_consumer, :oauth_token

        def initialize(app_id:)
          @app_id = app_id
        end

        include Connection
        include Request
        include Client::Onecall

        def base_url
          "#{OAUTH_PROVIDER_SITE}/data/2.5"
        end

        def default_params
          {
            appid: @app_id
          }
        end

        private

        def logger
          ExternalApis::OpenWeatherMap.logger
        end
      end
    end
  end
end
