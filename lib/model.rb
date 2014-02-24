class Model
  attr_accessor :id

  def initialize(attrs)
    @id = attrs[:id]
  end

  def self.create(attrs)
    self.new attrs
  end
end