# SanitizeSqlLike

[![Gem Version](https://img.shields.io/gem/v/sanitize_sql_like.svg?style=flat)](https://rubygems.org/gems/sanitize_sql_like)
[![Build Status](https://github.com/khiav223577/sanitize_sql_like/workflows/Ruby/badge.svg)](https://github.com/khiav223577/sanitize_sql_like/actions)
[![RubyGems](http://img.shields.io/gem/dt/sanitize_sql_like.svg?style=flat)](https://rubygems.org/gems/sanitize_sql_like)
[![Code Climate](https://codeclimate.com/github/khiav223577/sanitize_sql_like/badges/gpa.svg)](https://codeclimate.com/github/khiav223577/sanitize_sql_like)
[![Test Coverage](https://codeclimate.com/github/khiav223577/sanitize_sql_like/badges/coverage.svg)](https://codeclimate.com/github/khiav223577/sanitize_sql_like/coverage)

Backport #sanitize_sql_like method from Rails 4 for Rails 3.

Sanitizes a string so that it is safe to use within an SQL LIKE statement. 

This method uses `escape_character` to escape all occurrences of “", ”_“ and ”%“

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sanitize_sql_like'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sanitize_sql_like

## Usage

Prevent SQL injection using LIKE operator in SQL query:
```rb
# Bad
User.where("nickname LIKE ?", "%#{params[:nickname]}%")

# Good
User.where("nickname LIKE ?", "%#{User.send(:sanitize_sql_like, params[:nickname])}%")
```




## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/khiav223577/sanitize_sql_like. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

