# Lato Media

## Installation

Add the lato_media gem on your Gemfile

```ruby
gem 'lato_media'
```

Install the gem

```console
bundle install
```

Copy the migrations

```console
rails lato_media:install:migrations
```

Exec migrations

```console
bundle exec rake db:migrate
```