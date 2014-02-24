class Post < Model
  attr_accessor :title, :body, :user_id

  def initialize(args = {})
    super args
    @title = args[:title]
    @body = args[:body]
    @user_id = args[:user_id]
  end

end