module Inflect
  module Inflector
    # Redefine String methods in the context of the current
    # scope, adding utility String methods such as #camelize.
    refine String do
      SNAKE_SEPARATOR = '_'

      def camelize
        self.split(SNAKE_SEPARATOR).map(&:capitalize!).join
      end
    end
  end
end