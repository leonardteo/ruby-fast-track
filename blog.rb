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
      "Content-Type" => "text/html"
    }

    @posts = Post.all
    
    # Get the template
    template = ERB.new(File.read("template.html.erb")) 
    response_body = [template.result(binding)]

    # The return array
    [200, headers, response_body]
  end
end
# Start the server
Rack::Server.start(:app => Blog.new, :Port => 3000, :server => "WEBrick")

