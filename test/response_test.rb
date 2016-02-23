require 'test_helper'
require 'inflect/response'

class ResponseTest < Minitest::Test
  def setup
    @content        = 'A response'
    @required_keys  = [:content, :served_by, :query_words, :handled_word]
    @service_name   = 'Service'
    @service_word   = 'NEWS'
  end

  def test_empty_response
    response = Inflect::Response.new
    refute response.valid?
    assert_equal response.errors.keys.sort, @required_keys.sort
  end

  # Should we test default parameters?
  def test_with_served_by_only
    options = { served_by: @service_name }
    response = Inflect::Response.new @content, options

    refute response.valid?

    absent_keys = @required_keys - ([:content] + options.keys)
    assert_equal response.errors.keys, absent_keys
  end

  def test_with_query_words_only
    options = { query_words: [@service_word] }
    response = Inflect::Response.new @content, options

    refute response.valid?

    absent_keys = @required_keys - ([:content] + options.keys)
    assert_equal response.errors.keys, absent_keys
  end

  def test_with_handled_word_only
    options = { handled_word: 'NEWS' }
    response = Inflect::Response.new @content, options

    refute response.valid?

    absent_keys = @required_keys - ([:content] + options.keys)
    assert_equal response.errors.keys, absent_keys
  end

  def test_with_two_required_attributes_content_as_string
    options = {
      served_by: @service_name,
      handled_word: @service_word
    }
    response = Inflect::Response.new @content, options

    refute response.valid?

    absent_keys = @required_keys - ([:content] + options.keys)
    assert_equal response.errors.keys, absent_keys
  end

  def test_with_content_as_string
    options = {
      served_by: @service_name,
      query_words: [@service_word],
      handled_word: @service_word
    }
    response = Inflect::Response.new @content, options

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

  def test_with_content_as_invalid_type
    content = [@content]
    options = {
      served_by: @service_name,
      query_words: [@service_word],
      handled_word: @service_word
    }
    response = Inflect::Response.new(content, options)

    refute response.valid?
    assert_equal response.errors.keys, [:content]
  end
end
