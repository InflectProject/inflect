module Inflect
  class Response
    attr_reader :content, :timestamp, :response_description

    def initialize(response_content, description)
      @content = response_content
      @timestamp = Time.now
      @response_description = {
        served_by: description[:served_by] || nil,
        query_words: description[:query_words] || [""],
        handled_word: description[:handled_word] || nil,
        talk_to_service: description[:talk_to_service] || false,
      }
    end
  end
end
