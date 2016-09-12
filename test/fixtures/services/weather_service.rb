class WeatherService < Inflect::AbstractService
  def initialize
    @priority = 2
    @words    = ['WEATHER']
  end

  def default
    content = {content: 'The weather for today, is like... hell.'}
    respond content, {type: 'simple'}
  end
end
