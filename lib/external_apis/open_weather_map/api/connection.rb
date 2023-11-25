# frozen_string_literal: true

module ExternalApis
  module OpenWeatherMap
    module Api
      module Connection
        def connection
          Faraday::Connection.new(options) do |connection|
            connection.use Faraday::Request::UrlEncoded
            connection.use Faraday::Response::ParseJson
            connection.use Faraday::Response::RaiseError
            connection.request :json, content_type: /\bjson$/
            connection.response :json, content_type: /\bjson$/
          end
        end

        def options
          { url: base_url, headers: headers }
        end

        def headers
          {
            'Content-Type': 'application/json',
            'User-Agent': 'CitiesWeather'
          }
        end
      end
    end
  end
end
