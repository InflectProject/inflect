require 'singleton'
require 'inflect/loader'
require 'inflect/configuration'

module Inflect
  # The class in charge of providing common access to available services across
  # all the application.
  class ServiceProvider
    include Singleton

    # Access available services.
    attr_reader :services

    # Load all services on provider instantiation.
    def initialize
      @services = load
    end

    def reload
      @services = load
    end

    private

    def load
      Loader.services(Inflect.configuration.services_path)
    end
  end
end
