require 'test_helper'

class AbstractServiceTest < Minitest::Test
	MockService = Class.new(Inflect::AbstractService)

	def setup
		@service = MockService
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
