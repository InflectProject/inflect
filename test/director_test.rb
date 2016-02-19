require 'test_helper'
require 'inflect/director'
require 'inflect/response'

class DirectorTest < Minitest::Test
  def setup
    services_path = File.join(__dir__, 'fixtures/services')
    @director = Inflect::Director.new(services_path)
  end

  def test_responds_to_services
    assert_respond_to @director, :services
  end

  def test_handle_should_return_response_object
    response = @director.handle(['NEWS'])
    assert_kind_of Inflect::Response, response,
      "Director#handle didn\'t returned a/n #{response.class}"
  end
end
