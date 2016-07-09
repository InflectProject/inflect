require 'inflect/loader'
require 'inflect/i18n'

module Inflect
  #Responsible of encapsulate all the content of the service response.
  class Response
    # Response content as itself.
    attr_reader :content
    # Response attributes like served_by and query_words.
    attr_reader :attributes
    # Response timestamp.
    attr_reader :timestamp
    #If is not a valid Response, errors lists the not valid attributes.
    attr_reader :errors

    # @param content [String, Hash] The response of the service. Required.
    # @param attributes [Hash] Contains all the attributes of service response.
    # @option attributes [Class] :served_by Handler Service. Instance of AbstractService. Required.
    # @option attributes [Array<String>] :query_words The list of words received on the request. Required.
    # @option attributes [String] :handled_word The handled word by the service. Required.
    # @return [Inflect::Response]
    def initialize(content=nil, attributes={})
      @content        =   content
      @timestamp      =   Time.now
      @errors         =   {}
      @attributes     =   attributes
    end

    # Keys of the required attributes.
    def self.attribute_keys
      @@attribute_keys = [:served_by, :query_words]
    end

    attribute_keys.each do |key|
      define_method :"valid_attribute_#{key}" do
        if attributes[key].nil?
          errors[key] = I18n.errors(key)
          return false
        end
        true
      end
      private :"valid_attribute_#{key}"
    end

    # Validates required attributes for a valid response.
    # @return [true, false]
    def valid?
      private_methods.grep(/valid_attribute/).collect do |method_name|
        self.send method_name
      end.all?
    end

    private

    def valid_attribute_content
      unless [String, Hash].include? content.class
        errors[:content] = I18n.errors('content')
        return false
      end
      true
    end
  end
end
