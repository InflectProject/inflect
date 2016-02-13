require 'inflect/loader'

module Inflect
  class Director
    attr_reader :services

    def initialize(services_path = nil)
      @services = @loader.services(services_path || File.expand_path(__dir__, '/services'))
    end

    # Finds the first Service that is able 
    # to handle the request and lets him do
    # the work.
    def handle(words)
      selected_service = nil
      services.each do |service|
        if service.valid?(words)
          selected_service = service
          break
        end
      end
      selected_service.handle words
    end
  end
end