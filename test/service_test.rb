require 'test_helper'
require 'fixtures/services/news_service'

class ServiceTest < Minitest::Test
  def setup
    @service = NewsService.instance
  end

  def test_default_action
    words = %W[NEWS]
    req   = Inflect::Request.new(words)

    assert @service.valid? req
    assert @service.serve(req).content, 'Default news'
  end

  def test_request_with_action
    words = %W[NEWS TODAY]
    req   = Inflect::Request.new(words)

    assert @service.valid? req
  end

  def test_request_with_action_and_arguments
    words = %W[NEWS TODAY BUENOS\ AIRES]
    req   = Inflect::Request.new(words)

    assert @service.valid? req
    assert_equal @service.serve(req).content, 'Mmm not so good weather for buenos aires today'
  end

  def test_request_with_dynamic_action_and_arguments
    words = %W[NEWS LOCATION BUENOS\ AIRES 15]
    req   = Inflect::Request.new(words)

    assert @service.valid? req
    assert_equal @service.serve(req).content, 'This is the news for the weather the next 15 days in buenos aires'
  end
end
