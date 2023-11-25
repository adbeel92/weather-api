# frozen_string_literal: true

module Cities
  class SearchController < ApplicationController
    def index
      # TODO: move to a service object
      @response = ExternalApis::OpenWeatherMap::Api.client.onecall(
        lat: 33.44,
        lon: -94.04
      )
    end

    private

    def search_params
      params.permit(:query)
    end
  end
end
