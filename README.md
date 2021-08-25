# BasicCrud

Contains base (overridable) logic for default controller actions index/show/edit/create/update/destroy

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
```ruby
class ApplicationController < ActionController::Base
  include BasicCrud
  
end
```
In this example, all controllers will inherit BasicCrud functionality.
You can also just include the Module into certain controllers.

Controllers must override the `restricted_params` method and permit params, e.g.:
```ruby
class ExampleController < ActionController::Base
  include BasicCrud

  def restricted_params
    params.require(:example).permit(:name, :thingy)
  end
end
```
https://edgeguides.rubyonrails.org/action_controller_overview.html#strong-parameters

Objects are stored in `@record` or `@records` and accessible in the views.

If you need additional functionality, e.g. special logic for your index page, just override `def index .. end`.
Be sure to store your results in `@record` or `@records`

You can also call the super method and inject a block:
```ruby
def index
  super do
    # your logic here, e.g. @record.attribute1 = "static string"
    # your logic is called between record fetching and displaying the view
  end
end
```

## Tests

Specs are written for a dummy rails app, run `rspec spec` to run the specs.
Because this gem needs controllers, the specs are located at `spec/dummy/spec`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rongworks/basic_crud.



## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
