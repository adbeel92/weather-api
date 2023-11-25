# frozen_string_literal: true

module ExternalApis
  module OpenWeatherMap
    module Api
      module Request
        # Perform an HTTP GET request
        def get(path, params: {}, headers: {})
          request(:get, path, params: params, headers: headers)
        end

        # Perform an HTTP POST request
        def post(path, params: {}, body: {}, headers: {})
          request(:post, path, params: params, headers: headers, body: body)
        end

        # Perform an HTTP PUT request
        def put(path, params: {}, body: {}, headers: {})
          request(:put, path, params: params, headers: headers, body: body)
        end

        # Perform an HTTP DELETE request
        def delete(path, params: {}, headers: {})
          request(:delete, path, params: params, headers: headers)
        end

        private

        # Perform an HTTP request
        def request(method, path, params: {}, headers: {}, body: {})
          response = connection.send(method) do |request|
            request.headers.merge!(headers)
            params.merge!(default_params)
            case method
            when :get, :delete
              request.url(path, params)
            when :post, :put
              request.url(path, params)
              request.body = body unless body.empty?
            end
          end

          response.body
        rescue Faraday::Error => e
          ExternalApis::OpenWeatherMap::Error.raise_from_faraday_error(e)
        end
      end
    end
  end
end
