module Inflect
  class << self
    attr_reader :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield configuration if block_given?
  end

  # The class in charge of centralizing the application's
  # configuration.
  class Configuration
    attr_accessor :services_path, :locale_path

    def initialize
      @services_path = File.join('lib', 'services')
      @locale_path   = File.join(File.dirname(__FILE__), 'locale/en.yml')
    end
  end
end
