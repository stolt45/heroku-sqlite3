# Heroku Compatible Sqlite3 Build

This is a standalone build of sqlite3 that'll play nice on Heroku. If you really want to use sqlite3 on Heroku...

### Getting it setup

This allows you to build the sqlite3 gem inside the dyno once the dyno is launched. It's weird and should be done in the buildpack but this was an easy enough hack. 

To get going either clone this repo into your dyno or add this repo as a submodule to your app like I did in [this example](https://github.com/stolt45/heroku-sqlite-example).

Once this is in place you can run the setup script **FROM INSIDE YOUR DYNO** and it should handle everything else for you. To do this I run it from the Procfile before booting the app, see the above example. 

`heroku-sqlite3/setup/setup.sh`

Yup it's a shell script, you might wanna see what it does before blindly running it.

### Other Shit to know

It's compatible with the default ruby buildpack. As such, you need to remove `sqlite3` from the production group in your Gemfile or the push will fail. The setup script adds it back in after the dyno is running.

The setup script drops a new bundle config in place so that the sqlite gem can be built against this standalone sqlite3 build that's packaged up here. 

The script also runs `bundle install` to get the sqlite3 gem installed. It's feels really weird to me do this at runtime. ::shrug::

This also expects that you'll have your sqlite3 database.yml in a file in `$RAILS_ROOT/config/sqlite3_database.yml`. Since Heorku will overwrite your database.yml, this will copy yours into place. It's entirely possible that this isn't needed and can just be done via the DATABASE_URL instead.


