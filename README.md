# Notes App web server


[![Build Status](https://travis-ci.org/gustavosobral/notes_server.svg?branch=master)](https://travis-ci.org/gustavosobral/notes_server)

An application web server built using Ruby on Rails 4.2 to serve a RESTFul JSON API for Notes application.

## Dependencies
The project needs to a MongoDB database and Elasticsearch search engine installed.

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

* Allow user authentication
* API namespacing
* Add swagger for documentation
