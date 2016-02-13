require 'abstract_service'

module Inflect
  # UnclearService is the Service in charge of responding when
  # no other one does, it has the PRIORITY set to INFINITY so
  # that it is always the last Service to be asked.
  class UnclearService < Inflect::AbstractService
    def initialize
      @priority = Float::INFINITY
      @words    = []
    end

    def valid?(words)
      true
    end

    # @todo Response must be standarized, see Issue #1 for more
    #   details https://github.com/InflectProject/inflect/issues/1 .
    def handle(words)
      #respond 'We couldn\'t match your request, please try again', {words: words, service: self}
      respond 'We couldn\'t match your request, please try again'
    end
  end
end
