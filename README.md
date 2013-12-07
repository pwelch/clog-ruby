# Clog

Clog is a Ruby gem CLI for the [Captain's Log]() Rails application.

## Installation

Add this line to your application's Gemfile:

    gem 'clog'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install clog

## Configuration

Example clog configuration file

```bash
#clog_config.yml

---
server: 'http://example.com/api'
api_key: 'API_KEY'
```

## Usage

```bash
 clog -m "Restarted apache in staging" -c /path/to/config
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
