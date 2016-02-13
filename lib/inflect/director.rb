require 'inflect/loader'
require 'inflect/configuration'

module Inflect
  # The class in charge of managing the access
  # and selection of the services.
  class Director
    attr_reader :services

    # @param services_path [String]
    def initialize(services_path = nil)
      @services = Loader.services(
        services_path || Inflect.configuration.services_path
      )
    end

    # Finds the first Service that is able 
    # to handle the request and lets him do
    # the work.
    # @param words [Array<String, Symbol>]
    def handle(words)
      services.select { |service| service.valid?(words) }.first
    end
  end
end