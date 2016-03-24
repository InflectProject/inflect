module Inflect
  module Inflector
    # Redefine String methods in the context of the current
    # scope, adding utility String methods such as #camelize.
    refine String do
      SNAKE_SEPARATOR = '_'

      def camelize!
        self.split(SNAKE_SEPARATOR).map(&:capitalize!).join
      end

      def camelize
        word = self.dup
        word.camelize!
      end

      def underscore!
        self.gsub!(/(?<=[a-z])[A-Z]/) do |char|
          char = SNAKE_SEPARATOR + char
        end
        self.downcase!
      end

      def underscore
        word = self.dup
        word.underscore!
      end
    end
  end
end