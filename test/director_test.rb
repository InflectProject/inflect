require 'test_helper'
require 'inflect/director'

class DirectorTest < Minitest::Test
  def setup
    services_path = File.join(__dir__, 'fixtures/services')
    @director = Inflect::Director.new(services_path)
  end

  def test_responds_to_services
    assert_respond_to @director, :services
  end

  # Depends on Inflect::Response implementation
  def test_handle_should_return_response_object
  end
end