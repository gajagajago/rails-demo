# MVC - Model, View, Controller

## Common flow
1. request made at browser
2. request received at router of rails app
3. request routed to appropriate action controller
4. action controller either renders a view template or communicates w/ model
5. model communicates with db
6. model sends back info to controller
7. controller renders view

## Conventional expectations
1. To set a route route, define @/config/routes.rb that points to a controller#action 
```
root 'pages#home'
```
- naming
```
pages_controller > home(action) # rails expects views/pages/home.html.erb
```
- command
```
rails generate controller pages # rails generates controller/pages_controller & views/pages
```
- To add another route, define @/config/routes.rb under root route definition
```
get 'about', to: 'pages/about'
```

## Backend - Models & DB
- SQL(Structured Query Language): performs CRUD on DB
- ORM(Object Relational Mapper): Communication btw rails app & db tables 
- ActiveRecord: ORM in rails
> ex. articles resource
> 1. articles table
> 2. article model
> 3. articles controller
> 4. views

- scaffold: tool to create all the resources needed for article model & migration file to create articles table
```
rails generate scaffold Article title:string description:text
# invoke active_record

rails db:migrate # create db & schema.rb 

rails routes --expanded # to see all the routes created
```

- naming convention
> - model: Article (article.rb)
> - table: articles 

- without scaffold
> 1. create migration file
```
rails generate migration create_articles # create migration file for articles table
#       invoke  active_record
        create    db/migrate/20201201085544_create_articles.rb # timestamp is only reason for using migration generator
```

> 2. add column attributes in migration file
```
ex. class CreateArticles < ActiveRecord::Migration[6.0]
      def change
        create_table :articles do |t|
          t.string :title
        end
      end
    end
```
```
rails db:migrate

rails db:rollback 
# if you need rollback of migration, since 1 migration file is only usable 1 time 
# not preferred when co-working. 
# so, always create new migration file
```
> 3. add model (article.rb)
```
# to add records via rails console
1.
Article.create(title: "aa", description: "bb")

2. 
article = Article.new
article.title = "aa"
article.description = "bb"
article.save

3.
article = Article.new(title: "aa", description: "bb")
article.save
```

