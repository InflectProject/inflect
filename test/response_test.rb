require 'test_helper'
require 'inflect/response'

class ResponseTest < Minitest::Test
  def setup
  end

  def test_empty_response
    response = Inflect::Response.new
    refute response.is_valid?
  end

  def test_response_with_served_by
    response = Inflect::Response.new 'response!', { served_by: 'Service' }
    refute response.is_valid?
  end

  def test_response_with_required_attributes_content_as_string
    response = Inflect::Response.new 'response!', { served_by: 'Service', handled_word: 'NEWS' }
    assert response.is_valid?
  end
  
  def test_response_with_required_attributes_content_as_hash
    response = Inflect::Response.new({ this_is_the_content: "response!" }, { served_by: 'Service', handled_word: 'NEWS' })
    assert response.is_valid?
  end
end
