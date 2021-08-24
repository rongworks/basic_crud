# BasicCrud

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/basic_crud`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'basic_crud'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install basic_crud

## Usage

In the (empty) controller, include basic_crud
```
class ApplicationController < ActionController::Base
  include BasicCrud
end
```
In this example, all controllers will inherit BasicCrud functionality.
You can also just include the Module into certain controllers.

Objects are stored in `@record` or `@records` and accessible in the views.

If you need additional functionality, e.g. special logic for your index page, just override `def index .. end`.
Be sure to store your results in `@record` or `@records`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/basic_crud.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
