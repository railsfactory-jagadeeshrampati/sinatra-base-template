require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require './todo.rb'

t =Todolist.new("rj.txt")
configure do
  set :views, "#{File.dirname(__FILE__)}/views"
end
enable :sessions
set :session_secret, 'randomesecretkey112324'

get '/' do
erb:todo
end 
post '/add' do
item =   params[:task1]
t.add(item)
t.list
t.save
erb:todo
end 
get '/pending' do 
@items=t.pending
  erb :pending
end
get '/completed' do
@items=t.completed
  erb :completed
end
get '/complete' do
@items=t.pending
  erb :complete
end
post '/complete' do
n1 = params[:num1].to_i
 t.complete(n1)
 t.list
 t.save
  @items = t.pending
  erb :complete
end
get '/delete' do
 @items = t.completed
erb :delete
end
post '/delete' do
 n = params[:num2].to_i
  t.delete(n)
  t.list
 t.save
 @items = t.completed
 erb :delete
end

