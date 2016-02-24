class NewsService < Inflect::AbstractService
  def initialize
    @priority = 0
    @words    = ['NEWS']
  end

  def handle(words)
    respond 'News Response', { query_words: words }
  end
end
