require 'inflect/response'

module Inflect
  # Allows services to respond an Inflect::Response instance.
  module Responsive
    # Method that creates Response instance.
    # @param words [Array<String>] The queried words.
    # @return [Inflect::Response | nil] Returns nil if response is not valid.
    def serve(words)
      content, options = handle(words)
      opts = merge_options(options, { query_words: words })
      response = validate_response(Inflect::Response.new(content, opts))
    end

    # Supply more expressiveness and flexibility to the interface
    # by allowing multiple ways of responding.
    # @example Only String
    #    respond 'String Response'
    # @example As a String with options
    #    respond 'String Response', opt: 'Extra options'
    # @example Or as a Hash with options
    #    respond({content: 'Hashed Response'}, {opt: 'Extra options'})
    def respond(content, options = {})
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
