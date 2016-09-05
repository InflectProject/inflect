class NewsService < Inflect::AbstractService
  def initialize
    @priority = 0
    @words    = %W[NEWS TODAY LOCATION]
  end

  def default
    respond 'Default news'
  end

  def today(args = nil)
    if args.nil?
      respond 'Beautiful weather for today in defaultland'
    else
      location = args.shift
      respond "Mmm not so good weather for #{location} today"
    end
  end

  def location(args)
    location = args.shift
    if args.nil?
      respond "This is the weather for the next 10 days in #{location}"
    else
      days = args.shift
      respond "This is the news for the weather the next #{days} days in #{location}"
    end
  end
end
