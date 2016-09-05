require 'test_helper'
require 'inflect/response'

class ResponseTest < Minitest::Test
  def setup
    @content        = 'A response'
    @required_keys  = [:content, :served_by, :query_words]
    @service_name   = 'Service'
    @service_word   = 'NEWS'
  end

  def test_with_content_as_string
    options = {
      served_by: @service_name,
      query_words: [@service_word],
      handled_word: @service_word
    }
    response = Inflect::Response.new(@content, options)

    assert response.valid?
    assert_equal response.errors.keys, []
  end

  def test_with_content_as_hash
    content = { this_is_the_content: @content }
    options = {
      served_by: @service_name,
      query_words: [@service_word],
      handled_word: @service_word
    }
    response = Inflect::Response.new(content, options)

    assert response.valid?
    assert_equal response.errors.keys, []
  end

  def test_to_hash
    content = @content
    options = {
      served_by: @service_name,
      query_words: [@service_word],
      handled_word: @service_word
    }

    response = Inflect::Response.new(content, options)
    assert_kind_of Hash, response.to_hash
  end
end
