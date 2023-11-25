# frozen_string_literal: true

require "external_apis/open_weather_map/api_error"
require "external_apis/open_weather_map/api/client"
require "external_apis/open_weather_map/error"

module ExternalApis
  module OpenWeatherMap
    module Api
      module_function

      def client
        @client ||= ::ExternalApis::OpenWeatherMap::Api::Client.new(
          app_id: 'a5a47c18197737e8eeca634cd6acb581'
        )
      end
    end
  end
end
