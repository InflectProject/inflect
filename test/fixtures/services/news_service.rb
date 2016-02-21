class NewsService < Inflect::AbstractService
  def initialize
    @priority = 0
    @words    = ['NEWS']
  end

  def handle(words)
    respond 'News Response', { served_by: self.class, query_words: words, handled_word: self.words.detect {|w| words.include? w } }
  end
end
