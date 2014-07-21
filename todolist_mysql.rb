require 'mysql2'
require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require './todo.rb'

con = Mysql2::Client.new(:host => "localhost", :username => "root", :password => 'root', :database => "todo")

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
res=con.query("insert into todolist(task_name,status) values('#{item}','pending')")
erb:todo
end 
get '/pending' do 
@items=con.query("select * from todolist where status='pending'") 
  erb :pending
end
get '/completed' do
@items=con.query("select * from todolist where status='done'") 
  erb :completed
end
get '/complete' do
@items=con.query("select * from todolist where status='pending'") 
  erb :complete
end
post '/complete' do
n1 = params[:num1].to_i
rs=con.query("update todolist set status='done' where s_no='#{n1}'") 
@items=con.query("select * from todolist where status='pending'") 
  erb :complete
end
get '/delete' do
@items=con.query("select * from todolist where status='done'") 
erb :delete
end
post '/delete' do
 n = params[:num2].to_i
rs = con.query("delete from todolist where s_no='#{n}'")
@items=con.query("select * from todolist where status='done'") 
 erb :delete
end

