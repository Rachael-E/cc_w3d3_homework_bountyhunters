require('pry')
require_relative('models/Bounty')

options_hash = { 'name' => 'Terry Trilobite', 'homeworld' => 'Pangaea', 'fav_weapon' => 'wand', 'bounty_value' => '100'}
bounty1 = Bounty.new( options_hash )

options_hash2 = { 'name' => 'Lisa Lingula', 'homeworld' => 'Laurentia', 'fav_weapon' => 'shield', 'bounty_value' => '50'}
bounty2 = Bounty.new( options_hash2 )

options_hash3 = { 'name' => 'Rick Raptor', 'homeworld' => 'Gondwana', 'fav_weapon' => 'sword', 'bounty_value' => '1000'}
bounty3 = Bounty.new( options_hash3 )
