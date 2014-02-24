class Model
  attr_accessor :id

  def initialize(attrs)
    @id = attrs[:id]
  end

  def self.create(attrs)
    self.new attrs
  end

  def self.set_table_name(name)
    @table_name = name
  end

  def self.set_db(db)
    @@db = SQLite3::Database.new db
  end

  # Queries the database
  def self.all
    # execute2 - first row is always the name of the column
    result = @@db.execute2 "SELECT * FROM #{@table_name}"
    columns = result.shift
    arr = []
    result.each do |row|
      attrs = {}
      columns.each_with_index do |col, i|
        attrs[col.to_sym] = row[i]
      end
      arr.push self.new(attrs)
    end
    arr
  end

  # Finds a single object
  def self.find(id)
    result = @@db.execute2 "SELECT * FROM #{@table_name} WHERE id = #{id} LIMIT 1"
    columns = result.shift
    row = result.first
    if row.nil?
      raise Exception.new "No record found"
    end
    attrs = {}
    columns.each_with_index do |col, i|
      attrs[col.to_sym] = row[i]
    end
    self.new(attrs)
  end

end