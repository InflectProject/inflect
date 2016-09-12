class ServiceService < Inflect::AbstractService
  def initialize
    @priority = 1
    @words    = %W[SERVICES]
  end

  def default
    respond words: all_words
  end

  private

  def all_words
    services.collect { |service| service.words }.flatten
  end
end
