require 'test_helper'
require 'inflect/loader'

class LoaderTest < Minitest::Test
  def setup
    services_path = File.join('test', 'fixtures', 'services')

    @services = Inflect::Loader.services(services_path)
  end

  def test_services_returns_an_array
    refute_empty @services
  end

  def test_services_returns_a_service_class
    service = @services.first
    assert_equal service.class.superclass, Inflect::AbstractService
  end

  # Getting paranoid...
  def test_all_loaded_classes_are_services
    check_service = Proc.new do |service_class|
      service_class.class.superclass == Inflect::AbstractService
    end

    assert @services.map(&check_service).reduce { |a, b| a && b }
  end

  def test_services_are_sorted_by_priority
    assert_operator @services.shift.priority, :<=, @services.shift.priority
  end

  def test_locale_is_loaded_properly
    fixture_path = File.join(__dir__, 'fixtures/locale/dummy.yml')
    locale = Inflect::Loader.locale(fixture_path)

    assert_equal locale.class, Hash
  end
end
