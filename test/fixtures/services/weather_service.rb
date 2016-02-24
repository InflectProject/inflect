class WeatherService < Inflect::AbstractService
  def initialize
    @priority = 2
    @words = ['WEATHER']
  end

  def handle(words)
    respond 'The weather for today, is like... hell.'
  end
end
