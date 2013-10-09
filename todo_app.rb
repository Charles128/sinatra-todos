$LOAD_PATH.unshift(File.expand_path('.'))

require 'sinatra'
require 'sinatra/activerecord'

require 'models/todo'


# This loads environment variables from the .env file
require 'dotenv'
Dotenv.load

set :database, ENV['DATABASE_URL']

get '/' do
  @todos = Todo.all
  erb :index
end

post '/' do
 # "#{params["New Todo"]}"
  Todo.create(params)
  redirect '/'
end
