require 'inflect/response'

module Inflect
  # Allows services to respond an Inflect::Response instance.
  module Responsive
    # Method that creates Response instance.
    # @param words [Array<String>] The queried words.
    # @return [Inflect::Response, nil] Returns nil if response is not valid.
    def serve(words)
      content, options = handle(words)
      opts = merge_options(options, { query_words: words })
      validate_response(Inflect::Response.new(content, opts))
    end

    def respond(content, options= {})
      [content, options]
    end

    private

    def validate_response(response)
      response.valid? ? response : nil
    end

    def merge_options(*options)
      options.compact.inject(default_options) do |combined_options, current_options|
        combined_options.merge current_options
      end
    end

    # Set a Hash with required +option+ parameters for Inflect::Response.
    # @return [Hash]
    def default_options
      {served_by: self.class}
    end
  end
end
