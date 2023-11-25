# frozen_string_literal: true

module ExternalApis
  module OpenWeatherMap
    class ApiError < StandardError
      class_attribute :message, :status, :code

      def initialize(message = nil)
        @message = message if message
        super
      end

      class << self
        def [](message = nil, status: :bad_request, code: nil, &block)
          klass = Class.new(self, &block)

          klass.message = message if message
          klass.status = status if status
          klass.code = code if code

          klass
        end

        alias build []
      end

      def to_json(_obj = nil)
        { error: { type: error_type, code: code, message: message } }
      end

      def status
        Rack::Utils::SYMBOL_TO_STATUS_CODE[self.class.status]
      end

      private

      def error_type
        self.class.name.demodulize.underscore.gsub(/_error\z/, '')
      end
    end
  end
end
