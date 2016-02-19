class NewsService < Inflect::AbstractService
  def initialize
    @priority = 0
    @words    = ['NEWS']
  end

  def valid?(words)
    @words.select { |my_word| words.include? my_word }.reduce { |a, b| a || b }
  end

  def handle(words)
    respond 'News Response'
  end
end
