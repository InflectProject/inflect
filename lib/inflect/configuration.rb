module Inflect
  class << self
    attr_reader :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure(&block)
    yield configuration
  end

  # The class in charge of centralizing the application's
  # configuration.
  class Configuration
    attr_reader :services_path

    def initialize
      @services_path = File.join(__dir__, 'services')
    end
  end
end