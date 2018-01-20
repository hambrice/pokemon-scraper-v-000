require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  def initialize(hash, hp = nil)
    @id = hash[:id]
    @name = hash[:name]
    @type = hash[:type]
   @db = hash[:db]
   @hp = hp
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
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
