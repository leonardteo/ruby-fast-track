# This is a user class
class User < Model
  attr_accessor :first_name, :last_name, :posts

  set_table_name "users"

  def initialize(args = {})
    super args
    @first_name = args[:first_name]
    @last_name = args[:last_name]
  end

  def name
    "#{first_name} #{last_name}"
  end
end