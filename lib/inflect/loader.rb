require_relative './services/abstract_service'
require 'pry'

module Inflect
  # Responsable for loading all the services for Inflect
  # to comunicate with them and decide wich one will handle
  # the request.
  module Loader
    # Loads all the services from the given path, sorted by
    # PRIORITY from lowest (1) to highest (INFINITY).
    # 
    # @params path [String] A String indicating the path to
    #   the services directory.
    # @return [Array] The Service Classes sorted by PRIORITY.
    def self.services(path)
      mods = []
      # @todo: Extract path to Configuration class.
      # @todo: Manage exceptions during file requiring.
      Dir["#{path}/*.rb"].each do |file|
        begin
          require "#{file}"
        rescue IOError => e
          puts e.message
        end

        filename = File.basename(file, '.rb')
        mods << AbstractService.const_get(camelize(filename))
      end
      mods
    end

    private

    SNAKE_SEPARATOR = '_'

    # @todo Extract camelize method a proper domain Object, 
    # camelizing a string should not be the Loader's responsability, 
    # but.. its a start.
    def self.camelize(str)
      str.split(SNAKE_SEPARATOR).map(&:capitalize!).join
    end
  end
end