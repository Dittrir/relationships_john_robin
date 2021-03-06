# Relationships

Robin Dittrich and John Napier

## Learning Goals

* Design a one to many relationship using a schema designer
* Write migrations to create tables with columns of varying data types and foreign keys.
* Use Rails to create web pages that allow users to CRUD resources
* Create instance and class methods on a Rails model that use ActiveRecord methods and helpers
* Write model and feature tests that fully cover data logic and user behavior

![Screen Shot 2021-11-29 at 4 13 12 PM](https://user-images.githubusercontent.com/89048720/143962659-075fde7e-95f5-47db-9131-31c10f2d6248.png)

## Set up

* First run a `bundle install` and `bundle update` in your terminal.
* Then you will want to drop whatever databases you have (`rails db:drop`), create a new one with the info from our database (`rails db:create`), and migrate it (`rails db:migrate`)
* Finally, use our seeds file to populate your data by running `rails db:seed`
