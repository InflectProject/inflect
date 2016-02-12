require 'test_helper'
require 'inflect/inflector'

class InflectorTest < Minitest::Test
  using Inflect::Inflector

  def test_camelize
    assert_equal 'inflect_master'.camelize, 'InflectMaster'
  end
end