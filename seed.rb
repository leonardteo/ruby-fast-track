# Seeds a SQLite3 database
require 'sqlite3'

db_file = "blog.db"

def define_schema(db_file)
  if File.exists? db_file
    File.delete db_file
  end

  db = SQLite3::Database.new db_file
  db.execute "CREATE TABLE users ( id INTEGER PRIMARY KEY ASC, first_name VARCHAR(255), last_name VARCHAR(255) )"
  db.execute "CREATE TABLE posts ( id INTEGER PRIMARY KEY ASC, title VARCHAR(255), body TEXT, user_id INTEGER )"
end

def seed_data(db_file)

  db = SQLite3::Database.new db_file
  
  # Insert a user
  db.execute "INSERT INTO users (first_name, last_name) VALUES ('Leo', 'Teo')"

  # Insert posts
  lorem_ipsum = "Bacon ipsum dolor sit amet beef shoulder frankfurter brisket short loin. Capicola shankle pork belly, turducken chuck doner leberkas short loin. Boudin strip steak pork loin shankle flank spare ribs shoulder. Ball tip leberkas beef shank jerky beef ribs tongue capicola short loin pork belly filet mignon ribeye pork doner."
  db.execute "INSERT INTO posts (title, body, user_id) VALUES ('Hello Blog', '#{lorem_ipsum}', 1)"
  db.execute "INSERT INTO posts (title, body, user_id) VALUES ('Hello Blog 2', '#{lorem_ipsum}', 1)"
  db.execute "INSERT INTO posts (title, body, user_id) VALUES ('Hello Blog 3', '#{lorem_ipsum}', 1)"
end

define_schema(db_file)
seed_data(db_file)
