# cap-elastics


Cap extension for the elastics gem (https://rubygems.org/gems/elastics-rails).

Use this exetension to rebuild the Elastic Search index on a server.

## Installation

    gem install cap-elastics

Or if in the context of something using bundler such as Rails, add to Gemfile
eg:

    gem 'elastics', :group => :development

Add to top of a relevant Capistrano file (such as config/deploy.rb ordinarily):

    require 'cap_elastics'

This makes cap-elastics's tasks available to you.

## Usage

The cap-elastics extension adds two tasks to your capistrano setup:

    cap elastics:reindex         # Reindex ElasticSearch on a remote server.
    cap deploy:elastics:reindex  # Deploy the app and reindex (similar to cap deploy:migrations).

## Copyright

Copyright © 2013 Tiago Franco and contributors

Licensed under the same license as Emacs (GPL v3 or later) unless otherwise specified.
