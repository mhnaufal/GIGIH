require 'sinatra'
require_relative 'config'

get '/' do
  'This is the homepage'
end

get '/message' do
  # "<h1 style=\"background-color:pink;\">Hello GIGIH}!</h1>"
  erb :message, locals: {
    name: 'Generasi GIGIH',
    color: 'pink'
  }
end

get '/message/:name' do
  name = params['name']
  color = params['color'] ? params['color'] : 'DodgerBlue'
  erb :message, locals: {
    name: name,
    color: color
  }
end

get '/login' do
  erb :login
end

post '/login' do
  if params['username'] == 'admin' && params['password'] == 'admin'
    return 'Logged in'
  else
    redirect '/login'
  end
end

### Homework

all_items = [
  {"name" => "Fish", "category" => "Food", "price" => 2000},
  {"name" => "Water", "category" => "Beverage", "price" => 500},
]

# List of items
get '/items' do
  erb :items, locals: {
    items: all_items
  }
end

# Add new item page
get '/items/add' do
  erb :create_item
end

# Save item page
post '/items/add' do
  # Validation
  name = params['name']
  category = params['category']
  price = params['price']

  is_item_exist = all_items.any? {
    |item| item["name"] == name
  }

  if is_item_exist
    puts "Item #{name} already exist!"
    redirect '/items/add'
    return
  end

  if not category.eql?("Food") and not category.eql?("Beverage")
    puts "Category not allowed!"
    redirect '/items/add'
    return
  end
  
  if not price.is_i?
    puts "The price must be a number"
    redirect '/items/add'
    return
  end

  item = {"name" => name, "category" => category, "price" => price}
  all_items.push(item)

  redirect '/items'
  
end

# Helper
class String
  def is_i?
     /\A[-+]?\d+\z/ === self
  end
end
