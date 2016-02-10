require 'test_helper'
require 'inflect/loader'

class LoaderTest < Minitest::Test
  def setup
    @services = Inflect::Loader.services(__dir__ + '/fixtures/services')
  end

  def test_services_returns_an_array
    refute_empty @services
  end

  def test_services_returns_a_service_class
    service = @services.first
    assert_equal service.superclass, Inflect::AbstractService
  end

  # Getting paranoid...
  def test_all_loaded_classes_are_services
    check_service = Proc.new do |service_class| 
      service_class.superclass == Inflect::AbstractService
    end

    assert @services.map(&check_service).reduce { |a, b| a && b }
  end

  def test_services_are_sorted_by_priority
    assert_operator @services.shift::PRIORITY, :<=, @services.shift::PRIORITY
  end
end