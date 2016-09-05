require 'singleton'
require 'inflect/responsive'

module Inflect
  # Acts as an specification or standard required for a Service
  # Class to be consumed by the application. A Service Class is
  # just a wrapper for any possible service you'd like to give
  # support to, just by having four prerequisites.
  class AbstractService
    include Comparable
    include Singleton
    include Responsive

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

    # Receives a Request and returns true if the service can handle
    # the request given.
    # @param Inflect::Request
    # @return [Boolean]
    def valid?(request)
      (self.keyword.eql? request.keyword) &&
      action_defined(request.action)
    end

    # The +default+ is the method called when there is no action parameter inside
    # the words query array.
    def default
      no_method_error
    end

    # Returns a Hash with retrieved data by routing from the request
    # to the method specified by the request's action attribute.
    # @param Inflect::Request
    # @return Inflect::Response
    def handle(request)
      if action_defined(request.action) && !action_implemented(request.action)
        no_method_error
      else
        if request.arguments.empty?
          send request.action
        else
          send request.action, request.arguments
        end
      end
    end

    # Virtual attribute for the services keyword.
    def keyword
      words.first
    end

    # Virtual attributes for the service actions. Every action must
    # have its matching method.
    def actions
      words[1..-1]
    end

    private

    # Check if user defined the given action besides from the default_options
    # action that is always present.
    def action_defined(action)
      (action.eql? :default) || (actions.include? action.to_s.upcase)
    end

    # Check if user really implemented the method corresponding to
    # the action.
    def action_implemented(action)
      respond_to? action
    end

    # Method fired when users don't implement the method corresponding
    # to the actions they define in the +words+ array.
    def no_method_error
      message = "#{self.class} declared the action #{request.action}
             in #{self.words} but the method is missing, for more
             information see Inflect::AbstractService class."
      raise NoMethodError.new message
    end
  end
end
