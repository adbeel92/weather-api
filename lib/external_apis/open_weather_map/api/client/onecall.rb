# frozen_string_literal: true

module ExternalApis
  module OpenWeatherMap
    module Api
      class Client
        module Onecall
          def onecall(opts = {})
            path = "#{base_url}/onecall"

            query = Hash(
              'lat'     => opts[:lat],
              'lon'     => opts[:lon],
              'exclude' => opts[:exclude]
            ).compact

            get(path, params: query)
          rescue Faraday::Error => e
            ExternalApis::OpenWeatherMap::Error.raise_from_faraday_error(e)
          end
        end
      end
    end
  end
end
