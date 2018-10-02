# [See working app](http://invoicesimple.herokuapp.com/)

# Simple invoice system Rails app

Just few steps to run this app.Go to app folder
* install gems
`bundle install`
* create database
`rails db:create`
* run database migration
`rails db:migrate`
* and load  some test data
`rails db:seed`

Finaly run rails app server
`rails s`


## Features:
  - Add, Edit, Remove Product
  - Add Product to cart
  - Close your order and save as invoice
  - Adding product to cart generating invoice
  - It's only one open invoice in system

## Used gems and packages:
  - 'slim'
  - 'draper'
  - 'bootstrap'
  - 'rspec'
  - 'capybara'
  - 'rubocop'
  - 'overcommit'
