$LOAD_PATH.unshift(File.expand_path('.'))

require 'sinatra'
require 'sinatra/activerecord'

require 'models/todo'

ActiveRecord::Base.establish_connection(ENV['DATBASE_URL'] || "postgres://localhost/#{DB_NAME}")

# This loads environment variables from the .env file
require 'dotenv'
Dotenv.load

get '/' do
  @todos = Todo.all
  erb :index
end

post '/' do
 # "#{params["New Todo"]}"
  Todo.create(params)
  redirect '/'
end
