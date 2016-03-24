require 'test_helper'
require 'inflect/inflector'

class InflectorTest < Minitest::Test
  using Inflect::Inflector

  def test_camelize
    assert_equal 'InflectMaster', 'inflect_master'.camelize!
  end

  def test_underscore
    assert_equal 'inflect_master', 'InflectMaster'.underscore!
  end
end