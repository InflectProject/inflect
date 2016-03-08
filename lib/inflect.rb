require "inflect/version"
require "inflect/director"
require "inflect/configuration"
require "inflect/abstract_service"

module Inflect
  class << self
    # Start point to handle requested words.
    # @return [nil, Inflect::Response]
    def handle(words)
      director.handle(words)
    end

    private
    # Method that returns the Director instance reference.
    # @return [Inflect::Director]
    def director
      @@director ||= Director.new(self.configuration.services_path)
    end
  end
end
