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
    reload if configuration.services_path_changed
  end

  # The class in charge of centralizing the application's
  # configuration.
  class Configuration
    # Location of the services directory.
    attr_accessor :services_path

    # Location of the locale file.
    attr_accessor :locale_path

    # Default service path
    attr_accessor :default_path


    def initialize
      @default_path = File.join('lib', 'services')
      @services_path = @services_path || default_path
      @locale_path   = File.join(File.dirname(__FILE__), 'locale/en.yml')
    end

    def services_path_changed
      !services_path.eql? default_path
    end
  end
end
