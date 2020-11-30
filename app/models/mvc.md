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
- SQL(Structured Query Language)
- ORM(Object Relational Mapper): Communication btw rails app & db tables 
> ActiveRecord
