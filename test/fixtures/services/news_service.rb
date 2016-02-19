class NewsService < Inflect::AbstractService
  def initialize
    @priority = 0
    @words    = ['NEWS']
  end

  def handle(words)
    description = {
      served_by: self.class,
      query_words: words,
      handled_word: self.words
    }
    respond 'News Response', description
  end
end
