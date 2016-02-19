require 'test_helper'
require_relative './fixtures/services/news_service'
require 'inflect/response'
require 'inflect/responsive'

class ResponsiveTest < Minitest::Test
  def setup
    NewsService.class_eval do
      include Inflect::Responsive
    end

    @service = NewsService.instance
  end

  def test_can_response
    assert_respond_to @service, :respond
  end

  def test_responds_with_response_object
    words = ['NEWS']
    assert_equal @service.handle(words).class, Inflect::Response
  end
end
