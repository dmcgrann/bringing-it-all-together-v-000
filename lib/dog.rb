class Dog
  attr_accessor :id, :name, :breed 
  
  def initialize(id: nil, name:, breed:)
    @id, @name, @breed = id, name, breed
  end
  
  def self.create_table
    sql = <<-SQL
      CREATE TABLE dogs (
        id INTEGER PRIMARY KEY,
        name TEXT,
        breed TEXT
        )
    SQL
    
    DB[:conn].execute(sql)
  end
  
  def self.drop_table
    sql = <<-SQL
     DROP TABLE dogs
    SQL

    DB[:conn].execute(sql)
    
  end
  
  def save
    sql = <<-SQL 
      INSERT INTO DOGS (name, breed) VALUES (?,?), name, breed
    SQL
    
    DB[:conn].execute(sql, self.name, self.breed)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM dogs")[0][0]
  end
  
end