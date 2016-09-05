class WeatherService < Inflect::AbstractService
  def initialize
    @priority = 2
    @words    = ['WEATHER']
    @options  = {type: 'simple'}
  end

  attr_reader :options

  def default
    content = {content: 'The weather for today, is like... hell.'}
    respond content, options
  end
end
