require 'test_helper'
require 'inflect/response'

class ResponseTest < Minitest::Test
  def setup
  end

  def test_empty_response
    response = Inflect::Response.new
    refute response.is_valid?
  end

  def test_response_with_served_by_only
    response = Inflect::Response.new 'response!', { served_by: 'Service' }
    refute response.is_valid?
  end
  def test_response_with_query_words_only
    response = Inflect::Response.new 'response!', { query_words: ['NEWS'] }
    refute response.is_valid?
  end
  def test_response_with_handled_word_only
    response = Inflect::Response.new 'response!', { handled_word: 'NEWS' }
    refute response.is_valid?
  end

  def test_response_with_two_requireds_attributes_content_as_string
    response = Inflect::Response.new 'response!', { served_by: 'Service', handled_word: 'NEWS' }
    refute response.is_valid?
  end

  def test_response_with_requireds_attributes_content_as_string
    response = Inflect::Response.new 'response!', { served_by: 'Service', query_words: ['NEWS'], handled_word: 'NEWS' }
    assert response.is_valid?
  end

  def test_response_with_requireds_attributes_content_as_hash
    response = Inflect::Response.new({ this_is_the_content: "response!" }, { served_by: 'Service', query_words: ['NEWS'], handled_word: 'NEWS' })
    assert response.is_valid?
  end

  def test_response_with_requireds_attributes_content_as_invalid_type
    response = Inflect::Response.new(["response!"], { served_by: 'Service', query_words: ['NEWS'], handled_word: 'NEWS' })
    refute response.is_valid?
  end
end
