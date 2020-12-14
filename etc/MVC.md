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
> 4. add validations
```
# article.rb
validates :title, prescence: true
```

## Show
- receive url from web -> routes.rb
```
  resources :articles, only: [:show] # only show action is available from web 
```
- send request to controller
> Should create controller, controller actions, views forehand
```
  def show
    # '@' makes article an 'instance variable' of a model
    @article = Article.find(params[:id])
  end
```
> byebug(gem)
> : stops web server and do debugging at server running terminal
> command: continue to stop debugging
```
  def show
    byebug # add byebug wherever you want to debug
    @article = Article.find(params[:id])
  end
```
3. interact w/ DB via model
4. post result from controller to web

## Views
- Templates
> <% %>: execute ruby code that has no return (condition/loop/block)
> <%= %>: when output
```
<% @people.each do |person| %>
  Name: <%= person.name %>
<% end %>
```

- Partials: render a partial view 
```
<%= render "menu %> # renders _menu.html.erb as a partial view
```

- FormHelper: create forms based on your models
> when submitted, form inputs are bundled into params object and pushed back to controller

> form_for
```
# equal to <%= form_with scope: :person, url: articles_path

<%= form_for @person, url: { action: "create" } do |f| %>
  <%= f.text_field :first_name %>
  <%= f.text_field :last_name %>
  <%= submit_tag 'Create' %>
<% end %>    
```

## Database
- ERD(Entity Relationship Diagram): relationship btw tables
> primary key vs foreign key
> 1. belongs_to: foreign key is stored in child table
> 2. has_one, has_many: foreign key is stored in parent table 

> ERD changes .rb files, not migration file
```
# belongs_to
class Book < ApplicationRecord
  belongs_to :author
end

# has_one
class Author < ApplicationRecord
  has_one :book
end

# has_many
class Author < ApplicationRecord
  has_many :books
end

# migration
class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.timestamps
    end

    create_table :books do |t|
      t.belongs_to :author
      t.datetime :published_at
      t.timestamps
    end
  end
end
```

## Session
- Does not require a model, so only controller & views
