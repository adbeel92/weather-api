# frozen_string_literal: true

module ExternalApis::OpenWeatherMap
  Error = ExternalApis::OpenWeatherMap::ApiError['OpenWeatherMap API returned an error', code: 1000] do
    def self.raise_from_faraday_error(error)
      raise_from_coded_error(error) || raise(error)
    end

    def self.raise_from_coded_error(error)
      logger.error(error)

      response = error.response
      raise(error) if response.nil?

      status   = response[:status].to_i
      klass = error.class
      error_message = response.dig(:body, :message)

      case status
      when (400..500)
        raise( klass, error_message )
      else
        raise( klass )
      end
    end

    def self.logger
      ExternalApis::OpenWeatherMap.logger
    end
  end

end
