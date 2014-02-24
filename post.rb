class Post < Model
  attr_accessor :title, :body, :user_id

  set_table_name "posts"

  def initialize(args = {})
    super args
    @title = args[:title]
    @body = args[:body]
    @user_id = args[:user_id]
  end

  def user
    User.find @user_id
  end

end