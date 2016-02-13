require 'inflect/inflector'
require 'inflect/configuration'

module Inflect
  # Responsable for loading all the services for Inflect
  # to comunicate with them and decide wich one will handle
  # the request.
  # 
  module Loader
    using Inflector
    # Loads all the services from the given path, sorted by
    # PRIORITY from lowest (1) to highest (INFINITY).
    # 
    # @param path [String] A String indicating the path to
    #   the services directory.
    # @return [Array] The Service Classes sorted by PRIORITY.
    def self.services(path)
      services = []

      Dir["#{path}/*.rb"].each do |file|
        require "#{file}"

        filename = File.basename(file, '.rb')
        base_service = Inflect.configuration.base_service
        
        services << base_service.const_get(filename.camelize).instance
      end
      services.sort
    end
  end
end