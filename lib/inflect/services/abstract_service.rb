module Inflect
  # Acts as an specification or standard required for a Service 
  # Class to be consumed by the application. A Service Class is 
  # just a wrapper for any possible service you'd like to give 
  # support to, just by having four prerequisites.
  class AbstractService
    include Comparable
    include Singleton

    # A +words+ Array constant with the key +words+ of the Service.
    # @example Array for New York Times service
    #   words = %W[ NEWS TODAY NEW\ YORK\ TIMES]
    attr_reader :words

    # In case there are modules that provide similar contents the
    # one with most +priority+ is picked.
    attr_reader :priority

    def initialize
      @priority = 0
      @words    = []
    end

    # Implement Comparable in order to be sortable.
    def <=> (other_service)
      priority <=> other_service.priority
    end

    # Receives an Array of words and returns true or false depending
    # if the Service can handle the request given by the words.
    #   
    # @param words [Array] an Array of strings with key words.
    # @return [Boolean]
    def valid?(words)
      message = "#{self.class} must implement valid? method,
             for more imformation see AbstractService class."
      raise NoMethodError.new message
    end

    # Returns a Hash with retrieved data.
    #
    # @param words [Array] an Array of strings with key words.
    # @todo Define a standard format for the handle response.
    def handle(words)
      message = "#{self.class} must implement handle method,
             for more imformation see AbstractService class."
      raise NoMethodError.new message
    end
  end
end