# README

## Project setup

```shell
# clone down this repo:
$ git clone git@github.com:josh-works/rails_engine.git

# optional, clone down spec harness
$ git clone git@github.com:turingschool/rales_engine_spec_harness.git

# now for our specific app setup
$ cd rails_engine
$ bundle
$ rake db:drop
$ rake db:create db:migrate
$ rake load_data:all

# run our rspec tests
$ rspec

# start rails server
$ rails server

# now run spec harness, from spec harness project root:
$ rake
```

# Project resources

- [Project description from backend.turing.io](http://backend.turing.io/module3/projects/rails_engine)
- [We used this data]( https://github.com/turingschool-examples/sales_engine/tree/master/data)
- [Eval against this spec harness](https://github.com/turingschool/rales_engine_spec_harness)
- [RSpec testing docs that might be useful](https://github.com/rspec/rspec-rails#have_http_status)



## Design Decisions made so far

### Lauren
/ pending

### Josh
- Not importing any more data than seems absolutely necessary. I.E. merchants data have four columns: [id, name, created_at, updated_at]. I'm bringing in only first two in initial migration, for two reasons:
  1. I can practice adding and modifying the tables down the road
  2. Josh (instructor) recommended not ever importing data or building functionality that you don't know that you need. "You'll never know less about the problem than you know right now"
- needed to figure out where to _require 'csv'_ in the app...
- ditto for transactions data
- I added "created_at" and "updated at" data in our Transactions migration. The columns are called 'trans_updated_at' and 'trans_created_at', to read in the data in the CSV, and to differenciate

### Misc useful resources

- Might need to refer to [this JSON lesson](http://backend.turing.io/module3/lessons/json_fundementals)
- This is an api-only app, per http://edgeguides.rubyonrails.org/api_app.html
- [Some project notes/notes for Lauren from first day's classes](https://gist.github.com/josh-works/d1bfafccc392fee2cee5a2ecf61efc56)
- [Nick's RSpec guide](https://gist.github.com/NicholasJacques/6bf2a7733055844e6b5e6a73025726bc)

#### Rake stuff:
- http://stackoverflow.com/questions/12461260/how-can-i-import-a-csv-file-via-a-rake-task
- http://stackoverflow.com/questions/3346108/how-to-write-rake-task-to-import-data-to-rails-app
- http://stackoverflow.com/questions/876396/do-rails-rake-tasks-provide-access-to-activerecord-models
- http://stackoverflow.com/questions/29881172/unknown-attribute-rails-on-import-csv-uninitialized-constant
