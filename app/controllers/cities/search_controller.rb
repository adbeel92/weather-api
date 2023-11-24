# frozen_string_literal: true

module Cities
  class SearchController < ApplicationController
    def index
      puts "Test: #{search_params[:query]}"
    end

    private

    def search_params
      params.permit(:query)
    end
  end
end
