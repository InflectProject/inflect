require 'test_helper'
require 'inflect/director'
require 'inflect/response'

class DirectorTest < Minitest::Test
  def setup
    @director = Inflect::Director.new
  end

  def test_responds_to_services
    assert_respond_to @director, :services
  end
end
