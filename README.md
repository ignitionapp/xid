# Xid

Xid is a globally unique id generator.

Xid uses the Mongo Object ID algorithm to generate globally unique ids with a different serialization format (base64) to make it shorter when transported as a string. (https://docs.mongodb.org/manual/reference/object-id/)

The format is made up of:
* 4-byte value representing the seconds since the Unix epoch
* 3-byte machine identifier
* 2-byte process id
* 3-byte counter, starting with a random value.

The serialized format is lowercase [base32](https://en.wikipedia.org/wiki/Base32) which offers the best compromise between readability, sortability & conciseness.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'xid'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install xid

## Usage

```rb
require 'xid'

xid = Xid.generate
# => <Xid::Xid ltjfwwb3n4jbqxia5ela>

xid.to_s
# => "ltjfwzz3n4jbqxiasmka"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Attributions

This gem is based on the original [Go library](https://github.com/rs/xid) with inspiration taken from a [Python port](https://github.com/graham/python_xid).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ignitionapp/xid.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
