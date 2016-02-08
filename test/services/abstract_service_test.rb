require 'test_helper'
require_relative '../../lib/inflect/services/abstract_service'

class AbstractServiceTest < Minitest::Test
	MockService = Class.new(Inflect::AbstractService)

	def setup
		@service = MockService.new
		@words = %w[Hakunah Matata]
	end

	def test_it_raises_no_method_error_if_valid_not_present
		assert_raises NoMethodError do
			@service.valid?(@words)
		end

		assert_raises NoMethodError do
			@service.handle(@words)
		end
	end
end