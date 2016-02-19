class WeatherService < Inflect::AbstractService
  def initialize
    @priority = 2
    @words = ['WEATHER']
  end

  def valid?(words)
    @words.select { |my_word| words.include? my_word }.reduce { |a, b| a || b }
  end

  def handle(words)
    respond 'The weather for today, is like... hell.'
  end
end
