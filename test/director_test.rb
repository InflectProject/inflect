require 'test_helper'
require 'inflect/director'
require_relative './fixtures/services/news_service'
require_relative './fixtures/services/weather_service'

class DirectorTest < Minitest::Test
  def setup
    @director = Inflect::Director.new('/test/fixtures/services')
  end

  def test_chooses_wright_service
    response = @director.handle(['WEATHER'])
    assert_equals response.served_by, WeatherService
  end
end