require 'inflect/loader'
require 'inflect/configuration'

module Inflect
  # The class in charge of managing the access
  # and selection of the services.
  class Director
    # List of the services loaded successfully sorted by priority.
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
      selected_service = select_service(words)
      if selected_service.nil?
        raise "No service can respond to #{words.first}"
      else
        selected_service.serve(words)
      end
    end

    private

    def select_service(words)
      services.find do |service|
        service.valid?(words)
      end
    end
  end
end
