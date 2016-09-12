$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'inflect'

require 'minitest/autorun'
require 'inflect/abstract_service'
require 'pry'

Inflect.configure do |c|
  c.services_path = 'test/fixtures/services'
end
