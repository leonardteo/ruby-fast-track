require 'sqlite3'
require 'rack'

require "./lib/model"
require "./user"
require "./post"

Model.set_db("blog.db")

# The blog class instantiates a Rack-compliant object
class Blog
  # Rack requires a .call(env) method
  # Rack just returns a single array
  def call(env)
    headers = {
      "Content-Type" => "text/plain"
    }

    posts = Post.all
    response = ""
    posts.each do |post|
      response += "#{post.title}\n"
      response += "#{post.user.name}\n"
      response += "#{post.body}\n\n"
    end

    # Response needs to respond to .each method, so we put the string in an array
    response_body = [response]
    # The return array
    [200, headers, response_body]
  end
end
# Start the server
Rack::Server.start(:app => Blog.new, :Port => 3000, :server => "WEBrick")

