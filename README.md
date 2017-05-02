# README

This will be some running notes from Josh (and eventually Lauren) on the project.


We'll clean this up before evals.
- [Project description from backend.turing.io](http://backend.turing.io/module3/projects/rails_engine)
- Might need to refer to [this JSON lesson](http://backend.turing.io/module3/lessons/json_fundementals)
- This is an api-only app, per http://edgeguides.rubyonrails.org/api_app.html
- [Some project notes/notes for Lauren from first day's classes](https://gist.github.com/josh-works/d1bfafccc392fee2cee5a2ecf61efc56)
- We need to import this data: https://github.com/turingschool-examples/sales_engine/tree/master/data
- [spec harness](https://github.com/turingschool/rales_engine_spec_harness)
- [Nick's RSpec guide](https://gist.github.com/NicholasJacques/6bf2a7733055844e6b5e6a73025726bc)

RSpec testing docs that might be useful:
- https://github.com/rspec/rspec-rails#have_http_status

I'm working through [today's API lesson](http://backend.turing.io/module3/lessons/building_an_api) and applying it to our models.


## Design Decisions made so far

### Josh
- Not importing any more data than seems absolutely necessary. I.E. merchants data have four columns: [id, name, created_at, updated_at]. I'm bringing in only first two in initial migration, for two reasons:

- I can practice adding and modifying the tables down the road
- Josh (instructor) recommended not ever importing data or building functionality that you don't know that you need. "You'll never know less about the problem than you know right now"
- needed to figure out where to _require 'csv'_ in the app...
- ditto for transactions data
- I added "created_at" and "updated at" data in our Transactions migration. The columns are called 'trans_updated_at' and 'trans_created_at', to read in the data in the CSV, and to differenciate 

### Misc useful resources

Rake stuff:
- http://stackoverflow.com/questions/12461260/how-can-i-import-a-csv-file-via-a-rake-task
- http://stackoverflow.com/questions/3346108/how-to-write-rake-task-to-import-data-to-rails-app
- http://stackoverflow.com/questions/876396/do-rails-rake-tasks-provide-access-to-activerecord-models
- http://stackoverflow.com/questions/29881172/unknown-attribute-rails-on-import-csv-uninitialized-constant
