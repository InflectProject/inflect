require "inflect/version"
require "inflect/director"
require "inflect/configuration"

module Inflect
  def self.handle(words)
    director.handle(words)
  end

  def self.director
    @@director ||= Director.new(self.configuration.services_path)
  end
  private_class_method :director
end
