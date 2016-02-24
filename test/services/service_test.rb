require 'test_helper'
require_relative './../fixtures/services/news_service'

class ServiceTest < Minitest::Test
  def setup
    @service = NewsService.instance
  end

  def test_valid_returns_boolean
    assert_kind_of FalseClass, @service.valid?(['NOTHING'])
  end
end
