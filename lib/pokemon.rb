require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  def initialize(attributes)
    attributes.each {|key, value| self.send(("#{key}="), value)}
  end
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end
  
  def self.find(id, db)
    hash={}
    #binding.pry
    #array = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?", id)[0]
    hash[:id] = id
    hash[:name] = db.execute("SELECT name FROM pokemon WHERE pokemon.id = ?", id)[0][0]
    hash[:type] = db.execute("SELECT type FROM pokemon WHERE pokemon.id = ?", id)[0][0]
    #binding.pry
    hash[:hp] = db.execute("SELECT hp FROM pokemon WHERE pokemon.id = ?", id)[0][0] 
    hash[:db] = db
    #binding.pry
    Pokemon.new(name: array[0], type: array[1], hp:array[2], db)
  end
  
  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE name = ?", hp, self.name)
  end
end
