# Inflect

The micro-framework for service integration.

## Overview

[![Gem Version](https://img.shields.io/gem/v/inflect.svg)](https://rubygems.org/gems/inflect)
[![Code Climate](https://codeclimate.com/github/InflectProject/inflect/badges/gpa.svg)](https://codeclimate.com/github/InflectProject/inflect)
[![Inline docs](https://inch-ci.org/github/InflectProject/inflect.png)](https://inch-ci.org/github/InflectProject/inflect)


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'inflect'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install inflect

## Usage

Generate your Service:

    $ bin/inflect generate:service weather

Implement at least the ServiceWeather#handle method:

```ruby
class WeatherService < Inflect::AbstractService
  def initialize
    @priority = 2
    @words    = %W[WEATHER TODAY]
  end

  def handle(words)
    respond "Weather for today is... very hot."
  end
end
```

Call Inflect with the array of words.

```ruby
words = %W[WEATHER TODAY]

Inflect.handle(words) # Return Response object with weather for today
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/inflect.
We follow the Ruby best practices and community-driven standards well explained in bbatsov's ruby-style-guide, see https://github.com/bbatsov/ruby-style-guide.

## Docs

To generate docs run (if not installed):

```ruby
  gem install yard
```
Then to generate the docs:

    $ yardoc

To run doc server:

    $ yard server

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
