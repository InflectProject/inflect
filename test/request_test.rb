require 'test_helper'
require 'inflect/request'

class RequestTest < Minitest::Test
  def test_default_action
    words = %W[WEATHER]

    request = Inflect::Request.new(words)
    assert request.action, :default
  end

  def test_action_with_arguments
    words = %W[WEATHER TODAY BUENOS\ AIRES]

    request = Inflect::Request.new(words)
    assert_equal request.keyword, 'WEATHER'
    assert_equal request.action, :today
    assert_equal request.arguments, ['buenos aires']
  end
end
