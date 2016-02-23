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
      @content    = content
      @timestamp  = Time.now
      @errors     = {}
      @attributes = extract_attributes(description)
    end

    # Validates required attributes for a valid response.
    # @return [true, false]
    def is_valid?
      private_methods.grep(/valid_attribute/).collect do |method_name|
        self.send method_name
      end.all?
    end

    private

    # @todo I18n errors.
    def valid_attribute_content
      unless [String, Hash].include? content.class
        @errors[:content] = 'Content must be a String or Hash instance.'
        return false
      end
      true
    end

    # @todo I18n errors.
    def valid_attribute_served_by
      if attributes[:served_by].nil?
        @errors[:served_by] = 'Handled service reference is required.'
        return false
      end
      true
    end

    # @todo I18n errors.
    def valid_attribute_query_words
      if attributes[:query_words].nil? || attributes[:query_words].empty?
        @errors[:query_words] = 'Queried words is required.'
        return false
      end
      true
    end

    # @todo I18n errors.
    def valid_attribute_handled_word
      if attributes[:handled_word].nil?
        @errors[:handled_word] = 'Handled words of service is required.'
        return false
      end
      true
    end

    # @todo Extract attribute_keys to configuration or some place else.
    def extract_attributes(description={})
      attribute_keys =
         [:served_by, :query_words, :handled_word, :talk_to_service,
          :speech_response]

      attributes = {}
      attribute_keys.each do |key|
        attributes.store key, description[key]
      end
      attributes
    end
  end
end
