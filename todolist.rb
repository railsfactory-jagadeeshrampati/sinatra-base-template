require 'mysql2'
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
con = Mysql2::Client.new(:host => "localhost", :username => "root", :password => 'root', :database => "todo")
res=con.query("insert into todolist(task_name,status) values('#{item}','pending')")
con.close
erb:todo
end 
get '/pending' do 
con = Mysql2::Client.new(:host => "localhost", :username => "root", :password => 'root', :database => "todo")
@items=con.query("select * from todolist where status='pending'") 
con.close 
  erb :pending
end
get '/completed' do
con = Mysql2::Client.new(:host => "localhost", :username => "root", :password => 'root', :database => "todo")
@items=con.query("select * from todolist where status='done'") 
con.close
  erb :completed
end
get '/complete' do
con = Mysql2::Client.new(:host => "localhost", :username => "root", :password => 'root', :database => "todo")
@items=con.query("select * from todolist where status='pending'") 
con.close
  erb :complete
end
post '/complete' do
n1 = params[:num1].to_i
con = Mysql2::Client.new(:host => "localhost", :username => "root", :password => 'root', :database => "todo")
rs=con.query("update todolist set status='done' where s_no='#{n1}'") 
@items=con.query("select * from todolist where status='pending'") 
con.close
  erb :complete
end
get '/delete' do
 con = Mysql2::Client.new(:host => "localhost", :username => "root", :password => 'root', :database => "todo")
@items=con.query("select * from todolist where status='done'") 
con.close
erb :delete
end
post '/delete' do
 n = params[:num2].to_i
con = Mysql2::Client.new(:host => "localhost", :username => "root", :password => 'root', :database => "todo")
rs = con.query("delete from todolist where s_no='#{n}'")
@items=con.query("select * from todolist where status='done'") 
con.close
 erb :delete
end

