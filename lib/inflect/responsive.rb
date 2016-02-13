require 'inflect/response'

module Inflect
  # Allows services to respond an Inflect::Response instance.
  module Responsive

    # Method that creates Response instance.
    # @param content [String, Hash] the response of the service.
    # @return [Inflect::Response]
    # @todo Manage additional and default options such as +words+ and +served_by+
    def respond(content)
      Inflect::Response.new content
    end
  end
end
