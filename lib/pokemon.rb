require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :db
  def initialize(hash)
    @id = hash[:id]
    @name = hash[:name]
    @type = hash[:type]
   @db = hash[:db]
  end
  
  def self.save(name, type, hp, db)
    db.execute("INSERT INTO pokemon (name, type, hp) VALUES (?, ?)",name, type, hp)
  end
  
  def self.find(id, db)
    hash={}
    hash[:id] = id
    hash[:name] = db.execute("SELECT name FROM pokemon WHERE pokemon.id = ?", id)[0][0]
    hash[:type] = db.execute("SELECT type FROM pokemon WHERE pokemon.id = ?", id)[0][0]
    hash[:db] = db
    #binding.pry
    Pokemon.new(hash)
  end
end
