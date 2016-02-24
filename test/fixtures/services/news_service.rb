class NewsService < Inflect::AbstractService
  def initialize
    @priority = 0
    @words    = ['NEWS']
  end

  def handle(words)
    respond 'News Response', { handled_word: 'NEWS', query_words: words }
  end
end
