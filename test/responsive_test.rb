require 'test_helper'
require_relative './fixtures/services/news_service'
require 'inflect/response'
require 'inflect/responsive'

class ResponsiveTest < Minitest::Test
  def setup
    @service = NewsService.instance
  end

  def test_can_respond
    assert_respond_to @service, :respond
  end

  def test_responds_with_response_object_simple_content
    assert_kind_of Inflect::Response, @service.serve(['NEWS'])
  end

  def test_responds_with_response_object_complex_content
    assert_kind_of Inflect::Response, @service.serve(['WEATHER'])
  end
end
