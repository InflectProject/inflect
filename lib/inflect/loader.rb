require 'abstract_service'
require 'inflect/inflector'

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
    # @todo Extract AbstractService reference to decouple module.
    def self.services(path)
      mods = []

      Dir["#{path}/*.rb"].each do |file|
        require "#{file}"

        filename = File.basename(file, '.rb')
        mods << AbstractService.const_get(filename.camelize).instance
      end
      mods.sort
    end
  end
end