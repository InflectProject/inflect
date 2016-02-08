require 'abstract_service'

module Inflect
  class UnclearService < Inflect::AbstractService
    PRIORITY = Float::INFINITY

    def valid?(words)
      true
    end

    def handle(words)
      # FIXME: response must be standarized, see Issue #1 for more
      # details https://github.com/InflectProject/inflect/issues/1 .
      {message: 'We couldn\'t match your request, please try again'}
    end
  end
end