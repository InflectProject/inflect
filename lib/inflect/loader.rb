require_relative './services/abstract_service'
require 'pry'

module Inflect
  module Loader
    def self.services(path)
      mods = []
      # TODO: Extract path to Configuration object.
      Dir["#{path}/*.rb"].each do |file|
        # binding.pry
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

    # TODO: extract to a proper domain Object, camelizing a
    # string should not be the Loader's responsability, but..
    # its a start.
    def self.camelize(str)
      str.split(SNAKE_SEPARATOR).map(&:capitalize!).join
    end
  end
end