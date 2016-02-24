require 'yaml'
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
        services << Inflect.const_get(filename.camelize).instance
      end
      services.sort
    end

    def self.locale(path = nil)
      @@locale ||= YAML.load_file(path || Inflect.configuration.locale_path)
    end
  end
end
