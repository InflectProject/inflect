require 'inflect/response'

module Inflect
  # Allows services to respond an Inflect::Response instance.
  module Responsive

    # Method that creates Response instance.
    # @param content [String, Hash] the response of the service.
    # @return [Inflect::Response, nil] Returns nil if response is not valid.
    def respond(content, options = {})
      valid_response(Inflect::Response.new(content, options))
    end

    # Method that creates Response instance, skipping response validation.
    # @param content [String, Hash] the response of the service.
    # @return [Inflect::Response]
    def respond!(content, options = {})
      Inflect::Response.new(content, options)
    end

    private
    def valid_response(response)
      response.is_valid? ? response : nil
    end
  end
end
