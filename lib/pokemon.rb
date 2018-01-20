class Pokemon
  attr_accessor :db
  def initialize(hash)
    @db = hash[:db]
  end
  
  def save(name, type, db)
    db.execute ()
  end
end
