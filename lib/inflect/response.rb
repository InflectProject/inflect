require 'inflect/loader'

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
      @error_messages =   Loader::locale['errors']
      @attributes     =   extract_attributes(description)
    end

    # Validates required attributes for a valid response.
    # @return [true, false]
    def is_valid?
      private_methods.grep(/valid_attribute/).collect do |method_name|
        self.send method_name
      end.all?
    end

    private

    def valid_attribute_content
      unless [String, Hash].include? content.class
        errors[:content] = @error_messages['content']
        return false
      end
      true
    end

    def valid_attribute_served_by
      if attributes[:served_by].nil?
        errors[:served_by] = @error_messages['served_by']
        return false
      end
      true
    end

    def valid_attribute_query_words
      if attributes[:query_words].nil? || attributes[:query_words].empty?
        errors[:query_words] = @error_messages['query_words']
        return false
      end
      true
    end

    def valid_attribute_handled_word
      if attributes[:handled_word].nil?
        errors[:handled_word] = @error_messages['handled_word']
        return false
      end
      true
    end

    # @todo Extract attribute_keys to configuration or some place else.
    def extract_attributes(description={})
      attribute_keys =
         [:served_by, :query_words, :handled_word]

      attributes = {}
      attribute_keys.each do |key|
        attributes.store key, description[key]
      end
      attributes
    end
  end
end
