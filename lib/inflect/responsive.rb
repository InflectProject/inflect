require 'inflect/response'

module Inflect
  # Allows services to respond an Inflect::Response instance.
  module Responsive

    # Method that creates Response instance.
    # @param content [String, Hash] the response of the service.
    # @return [Inflect::Response, nil] Returns nil if response is not valid.
    def respond(content, options = {})
      opts = merge_options(options)
      validate_response(Inflect::Response.new(content, opts))
    end

    # Method that creates Response instance, skipping response validation.
    # @param content [String, Hash] the response of the service.
    # @return [Inflect::Response]
    def respond!(content, options = {})
      opts = merge_options(options)
      Inflect::Response.new(content, opts)
    end

    private

    def validate_response(response)
      response.valid? ? response : nil
    end

    def merge_options(options)
      default_options.merge(options)
    end

    # Set a Hash with required +option+ parameters for Inflect::Response.
    # @return [Hash]
    def default_options
      {served_by: self.class}
    end
  end
end
