require 'inflect/request'
require 'inflect/service_provider_methods'

module Inflect
  # The class in charge of managing the access
  # and selection of the services.
  class Director
    include ServiceProviderMethods

    # Finds the first Service that is able
    # to handle the request and lets him do
    # the work.
    # @param words [Array<String, Symbol>]
    def handle(words)
      request = Inflect::Request.new(words)
      selected_service = select_service(request)
      if selected_service.nil?
        raise "No service can respond to #{request.keyword}"
      else
        selected_service.serve(request)
      end
    end

    def reload
      service_provider.reload
    end

    private

    def select_service(request)
      services.find do |service|
        service.valid? request
      end
    end
  end
end
