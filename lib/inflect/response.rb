require 'inflect/loader'
require 'inflect/i18n'

module Inflect
  #Responsible of encapsulate all the content of the service response
  class Response
    attr_reader :content, :attributes, :timestamp, :errors

    # @param content [String, Hash] The response of the service. Required.
    # @param description [Hash] Contains all the description of service response.
    # @option description [Class] :served_by Handler Service. Instance of AbstractService. Required.
    # @option description [Array<String>] :query_words The list of words received on the request. Required.
    # @option description [String] :handled_word The handled word by the service. Required.
    # @return [Inflect::Response]
    def initialize(content=nil, description={})
      @content        =   content
      @timestamp      =   Time.now
      @errors         =   {}
      @attributes     =   extract_attributes(description)
    end

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

    def extract_attributes(description={})
      attributes = {}

      self.class.attribute_keys.each do |key|
        attributes.store key, description[key]
      end
      attributes
    end
  end
end
