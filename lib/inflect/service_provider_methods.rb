require 'inflect/service_provider'
require 'pry'

module Inflect
  module ServiceProviderMethods
    def self.included(base)
      base.send :include, InstanceMethods
    end

    module InstanceMethods
      # Provide the Service Provider as a virtual attribute.
      def service_provider
        Inflect::ServiceProvider.instance
      end

      # Access available services through a virtual attribute.
      # @return [Enumerable[AbstractService]]
      def services
        service_provider.services
      end
    end
  end
end
