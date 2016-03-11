module Inflect
  class << self
    attr_reader :configuration
  end

  # Configuration instance reference.
  # @return [Inflect::Configuration]
  def self.configuration
    @configuration ||= Configuration.new
  end

  # Method that allows configuration via block.
  def self.configure
    yield configuration if block_given?
  end

  # The class in charge of centralizing the application's
  # configuration.
  class Configuration
    # Location of the services directory.
    attr_accessor :services_path

    # Location of the locale file.
    attr_accessor :locale_path


    def initialize
      @services_path = File.join('lib', 'services')
      @locale_path   = File.join(File.dirname(__FILE__), 'locale/en.yml')
    end
  end
end
