require 'test_helper'
require_relative './fixtures/services/news_service'
require_relative './fixtures/services/weather_service'
require 'inflect/response'
require 'inflect/responsive'

class ResponsiveTest < Minitest::Test
  def setup
    @news = NewsService.instance
    @weather = WeatherService.instance
  end

  def test_can_respond
    assert_respond_to @news, :respond
  end

  def test_responds_with_response_object_simple_content
    assert_kind_of Inflect::Response, @news.serve(['NEWS'])
  end

  def test_responds_with_response_object_complex_content
    assert_kind_of Inflect::Response, @weather.serve(['WEATHER'])
  end

  def test_response_has_optional_attributes
    assert @weather.serve(['WEATHER']).attributes.key? :type
  end
end
