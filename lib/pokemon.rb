class Pokemon
  attr_accessor :db
  def initialize(hash)
    @db = hash[:db]
  end
  
  def save(name, type, db)
    db.execute ("INSERT INTO pokemon (name, type) VALUES (?, ?, ?)",name, type)
  end
end
