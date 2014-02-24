require 'sqlite3'
require "./lib/model"
require "./user"
require "./post"

Model.set_db("blog.db")

posts = Post.all
posts.each do |post|
  puts post.title
  puts post.user.name
  puts post.body
  puts
end

