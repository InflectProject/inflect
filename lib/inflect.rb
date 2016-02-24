require "inflect/version"
require "inflect/director"
require "inflect/configuration"

module Inflect
  class << self
    def handle(words)
      director.handle(words)
    end

    private

    def director
      @@director ||= Director.new(self.configuration.services_path)
    end
  end
end
