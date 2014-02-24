# Seeds a SQLite3 database
require 'sqlite3'

db_file = "blog.db"

if File.exists? db_file
  File.delete db_file
end

db = SQLite3::Database.new db_file

db.execute "CREATE TABLE users ( id INTEGER PRIMARY KEY ASC, first_name VARCHAR(255), last_name VARCHAR(255) )"
db.execute "CREATE TABLE posts ( id INTEGER PRIMARY KEY ASC, title VARCHAR(255), body TEXT, user_id INTEGER )"
