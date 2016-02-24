class NewsService < Inflect::AbstractService
  def initialize
    @priority = 0
    @words    = ['NEWS']
  end

  # @todo Standarize #valid? for all services, should valid? return the matched word
  #   or should it return true or false.
  def valid?(words)
    @words.select { |my_word| words.include? my_word }.reduce { |a, b| a || b }
  end

  # @todo More refactoring on options!!!
  def handle(words)
    respond 'News Response', { handled_word: self.valid?(words), query_words: words }
  end
end
