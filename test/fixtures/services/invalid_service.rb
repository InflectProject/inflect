class InvalidService < Inflect::AbstractService
  def initialize
    @priority = 1
    @words    = %W[INVALID]
  end
end
