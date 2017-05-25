# require gems
require 'sinatra'
require 'sqlite3'

set :public_folder, File.dirname(__FILE__) + '/static'

db = SQLite3::Database.new("students.db")
db.results_as_hash = true

get '/' do
  erb :home
end

get '/students/new' do
  erb :new_student
end

post '/students' do
  db.execute("INSERT INTO students (name, campus, age) VALUES (?,?,?)", [params['name'], params['campus'], params['age'].to_i])
  redirect '/'
end

get '/students' do
  @students = db.execute("SELECT * FROM students") 
  erb :students
end

get '/students/delete' do 
  erb :delete
end

post '/students/delete' do 
  db.execute("DELETE FROM students WHERE name=?", [params['name']])
  redirect '/students'
end

