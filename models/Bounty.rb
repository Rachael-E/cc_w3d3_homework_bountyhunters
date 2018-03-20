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
    db = PG.connect( {dbname: 'bounty_hunter', host: 'localhost'} )

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

  def Bounty.all
    db = PG.connect( {dbname: 'bounty_hunter', host: 'localhost'} )

    sql = "SELECT * FROM bounties ORDER BY name;"

    db.prepare("get_all", sql)
    bounty_list = db.exec_prepared("get_all")

    db.close()

    bounty_objects = bounty_list.map {
      |bounty_hash| Bounty.new(bounty_hash) }

      return bounty_objects
  end

  def update
    db = PG.connect( {dbname: 'bounty_hunter', host: 'localhost'} )

    sql = "
      UPDATE bounties
      SET (name, homeworld, fav_weapon, bounty_value) = ($1,$2,$3,$4)
      WHERE id = $5
      ;
      "
      values = [@name, @homeworld, @fav_weapon, @bounty_value]

      db.prepare("update", sql)
      db.exec_prepared("update", values)

      db.close()


  end










end
