# Ruby
def after_save(&block)
  name = "Leo"

  # Run callback
  yield(name)
end

class Hello
  def self.hello_world
    after_save do |some_var|
      # Do something
      puts some_var

      puts self.inspect
    end
  end
end


Hello.hello_world





