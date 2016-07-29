# Notes App web server
An application web server built using Ruby on Rails 4.2 to serve a RESTFul JSON API for Notes application.

## Running
First, install the project dependencies with Bundler:

```
$ bundle install --without production
```

Then, run the test suite to verify that everything is working correctly:

```
$ rake test
```

## ToDo's:

* Add full-text search feature with ElasticSearch
* Configure Procfile to start the app
* Deploy application on production
* Configure a CI server to run test suite
