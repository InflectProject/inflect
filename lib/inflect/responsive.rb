require 'inflect/response'

module Inflect
  # Allows services to respond an Inflect::Response instance.
  module Responsive

    # Method that creates Response instance.
    # @param content [String, Hash] the response of the service.
    # @return [Inflect::Response]
    # @todo Manage additional and default options such as +words+ and +served_by+
    def respond(content, options = {})
      validate_response(Inflect::Response.new(content, options))
    end

    def validate_response(response)
      validate_attribute_content response
      validate_attribute_served_by response
      validate_attribute_query_words response
      validate_attribute_handled_words response
      response
    end

    def validate_attribute_content(response)
      unless [String, Hash].include? response.content.class
        raise 'Content must be a String or Hash instance.'
      end
      response
    end

    def validate_attribute_served_by(response)
      if response.response_description[:served_by].nil?
        raise 'Handled service reference is required.'
      end
      response
    end

    def validate_attribute_query_words(response)
      if response.response_description[:query_words].nil?
        raise 'Queried words is required.'
      end
      response
    end

    def validate_attribute_handled_words(response)
      if response.response_description[:handled_word].nil?
        raise 'Handled words of service is required.'
      end
      response
    end
  end
end
