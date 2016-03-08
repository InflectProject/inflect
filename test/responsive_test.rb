require 'test_helper'
require_relative './fixtures/services/news_service'
require_relative './fixtures/services/weather_service'
require 'inflect/response'
require 'inflect/responsive'

class ResponsiveTest < Minitest::Test
  def setup
    NewsService.class_eval do
      include Inflect::Responsive
    end

    @service = NewsService.instance

    # Added #handle! to test #respond! and thus test the validation skipping.
    # Service responds with no content.
    @service.instance_eval do
      def handle!(words)
        respond! nil
      end
    end

    WeatherService.class_eval do
      include Inflect::Responsive
    end

    @weather_service = WeatherService.instance
    @weather_service.instance_eval do
      def handle(words)
        'Invalid Service Response'
      end
    end
  end

  def test_can_respond
    assert_respond_to @service, :respond
  end

  def test_responds_with_response_object
    words = ['NEWS']
    assert_equal @service.responds_to(words).class, Inflect::Response
  end

  def test_responds_with_response_object_skipping_response_validation
    words = ['NEWS']
    response = @service.handle!(words)
    assert_equal response.class, Inflect::Response
    refute response.valid?
  end

  def test_raises_error_when_responds_non_response_instance
    words = ['WEATHER']
    assert_raises { @weather_service.responds_to(words) }
  end
end
