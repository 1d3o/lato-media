# Lato Media

[![Gem Version](https://badge.fury.io/rb/lato_media.svg)](https://badge.fury.io/rb/lato_media)

Lato is a Rails engine used to develop modular admin panels. This is the module used to manage attachments and media files.

## Installation

Install [lato_core](https://github.com/ideonetwork/lato-core) gem as required dependency.

Add the lato_media gem on your Gemfile:

```ruby
gem 'lato_media'
```

Install the gem:

```console
bundle install
```

Copy the migrations:

```console
rails lato_media:install:migrations
```

Exec migrations:

```console
bundle exec rake db:migrate
```

## TODO

Update paperclip version to avoid security vulnerabilities when a new paperclip version is online (>5.1.0) and publish update on rubygems.
