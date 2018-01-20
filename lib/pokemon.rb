class Pokemon
  attr_accessor :id, :name, :type, :db
  def initialize(hash)
    @id = hash[:id]
    @name = hash[:name]
    @type = hash[:type]
   @db = hash[:db]
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end
  
  def self.find(id, db)
    name: db.execute("SELECT name FROM pokemon WHERE pokemon.id = ?", id)
  end
end
