module Inflect
  #Responsible of encapsulate all the content of the service response
  class Response
    attr_reader :content, :response_description, :timestamp, :errors

    # @param content [String, Hash] The response of the service. Required.
    # @param description [Hash] Contains all the description of service response.
    # @option description [Class] :served_by Handler Service. Instance of AbstractService. Required.
    # @option description [Array<String>] :query_words The list of words received on the request. Required.
    # @option description [String] :handled_word The handled word by the service. Required.
    # @option description [Boolean] :talk_to_service If the service needs more information of the last handled word. Default false.
    # @option description [Boolean] :speech_response If the response must be speeched. Default false.
    # @return [Inflect::Response]
    def initialize(content=nil, description={})
      @content = content
      @timestamp = Time.now
      @errors = {}
      @response_description = {
        served_by: description[:served_by] || nil,
        query_words: description[:query_words] || nil,
        handled_word: description[:handled_word] || nil,
        talk_to_service: description[:talk_to_service] || false,
        speech_response: description[:speech_response] || false
      }
    end

    #Validates required attributes for a valid response
    # @return [true, false]
    def is_valid?
      valid_attribute_content & valid_attribute_served_by & valid_attribute_query_words & valid_attribute_handled_word
    end

    private
      def valid_attribute_content
        unless [String, Hash].include? content.class
          @errors[:content] = 'Content must be a String or Hash instance.'
          return false
        end
        true
      end

      def valid_attribute_served_by
        if response_description[:served_by].nil?
          @errors[:served_by] = 'Handled service reference is required.'
          return false
        end
        true
      end

      def valid_attribute_query_words
        if response_description[:query_words].nil? || response_description[:query_words].empty?
          @errors[:query_words] = 'Queried words is required.'
          return false
        end
        true
      end

      def valid_attribute_handled_word
        if response_description[:handled_word].nil?
          @errors[:handled_word] = 'Handled words of service is required.'
          return false
        end
        true
      end
  end
end
