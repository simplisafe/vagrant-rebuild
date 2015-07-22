# Vagrant Rebuild

Plugin for vagrant that stops and deletes all traces of the vagrant machine then starts and provisions the vagrant environment. All options from destroy and up are still available.

## Installation

1. Install the latest version of [Vagrant](http://www.vagrantup.com/downloads.html)
2. Install the latest version of vagrant-rebuild

    $ vagrant plugin install vagrant-rebuild

## Usage

If the Vagrant Rebuild plugin is installed, `vagrant rebuild` will be available for use.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake false` to run the rebuilds. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/simplisafe/vagrant-rebuild.

