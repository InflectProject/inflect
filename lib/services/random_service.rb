class RandomService < Inflect::AbstractService
  # A WORDS Array constant with the key words of the Service,
  # the first word of the array represents the keyword for the
  # service, the second represents the action (method), and all the rest are
  # the arguments to that action.
  # @example Array for New York Times service
  #   words = %W[NEWS TODAY NEW\ YORK\ TIMES]
  #
  # This would mean that the service would handle request with the
  # keyword NEWS, in it's #today method with the arguments "new york times".

  # In case there are modules that provide similar contents the
  # one with most PRIORITY is picked.
  # Float::Infinity is the lowest priority.
  def initialize
    @priority = 1
    @words    = %W[RANDOM].freeze
  end

  # This method is the only one needed for Inflect to work.
  # Implements how the service responds to a request that has no
  # action attribute.
  # @return Inflect::Response
  def default
    super
  end
end
