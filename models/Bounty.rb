require ('pg')
require ('pry')

class Bounty

attr_accessor :name, :homeworld, :fav_weapon, :bounty_value

attr_reader :id

  def initialize( options )
    @name = options['name']
    @homeworld = options['homeworld']
    @fav_weapon = options['fav_weapon']
    @bounty_value = options['bounty_value'].to_i
    @id = options['id']
  end

  def save
    db = PG.connect( {dbname: 'bounties', host: 'localhost'} )

    sql = "
      INSERT INTO bounties
      (name, homeworld, fav_weapon, bounty_value)
      VALUES
        ($1,$2,$3,$4)
        ;
      "
      values = [@name, @homeworld, @fav_weapon, @bounty_value]

      db.prepare("save_into_database", sql)
      db.exec_prepared("save_into_database", values)

      db.close()
  end










end
