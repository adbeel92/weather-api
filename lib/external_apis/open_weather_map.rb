# frozen_string_literal: true

module ExternalApis
  module OpenWeatherMap
    # Module Accessors
    mattr_accessor :log_level, :timeout

    # Debug should be our default for the logger
    self.log_level  = ::Logger::DEBUG
    self.timeout    = 2.minutes

    # @return [Object] Instance of Logger
    def self.logger
      @logger ||= begin
        logger          = ::Logger.new($stderr)
        logger.progname = self.module_name.upcase
        logger.level    = self.log_level
        logger
      end
    end

    # @return [String] Environment
    def self.env
      ENV['RAILS_ENV'] || ENV['RACK_ENV']
    end

    # @return [Boolean] is it the test environment
    def self.test?
      (env == 'test')
    end

    # @return [String] Module Name
    def self.module_name
      self.name.split(':').last
    end

  end
end
