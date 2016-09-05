module Inflect
  # Class that parses the incoming data and builds the semantics
  # around the request.
  class Request
    attr_reader :keyword, :action, :arguments, :query_words
    #
    # The request is built from an array of words.
    # Depending on the size the arguments and the action are built in a different
    # ways.
    # @example
    #   %W[WEATHER] -> {service_key: weather, action: 'default'}
    #   %W[WEATHER TODAY] -> {service_key: weather, action: 'today'}
    #   %W[WEATHER TODAY BUENOS\ AIRES] -> {service_key: weather, action: 'today',
    #   args: ['Buenos Aires']}
    def initialize(words)
      @query_words = words.dup
      @keyword = words.shift
      @action = words.first.nil? ? :default : words.shift.downcase.to_sym
      @arguments = words.map(&:downcase)
    end
  end
end
