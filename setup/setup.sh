#!/bin/bash

echo "Adding sqlite3 to Gemfile"
echo "gem 'sqlite3'" >> ~/Gemfile

echo "Setting up bundler config"
cp bundle_config ~/.bundle/config

echo "Running bundle install to build the sqlite3 gem"
bundle install

echo "Move the sqlite3 database.yml file into place, heroku will overwrite the default one"
cp ~/config/sqlite3_database.yml ~/config/database.yml
