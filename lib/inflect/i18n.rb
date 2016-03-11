require 'inflect/loader'

module Inflect
  # Responsible of internationalization logic in the app.
  module I18n
    # Returns error message inside the locale file.
    # @param key [Symbol, String] The key to error message.
    # @return [String] Translation of the error message.
    def self.errors(key)
      Loader::locale['errors'][key.to_s]
    end
  end
end
