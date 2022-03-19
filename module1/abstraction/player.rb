#player.rb

class Player
  def initialize(name, monsters = [])
    @name = name
    @monsters = monsters
  end

  # Add a monster into the player list of monsters
  def add_monster(monster)
    @monsters.push(monster)
  end

  # Get current player's monsters
  def get_monsters
    @monsters
  end

  # Print out information about the current Player object
  def info
    inf = "#{@name}:\n"
    @monsters.each {
      |monster| inf = inf + monster.to_s + ", "
    }
    inf.delete_suffix!(", ")
    puts "#{inf}\n"
  end

  # Player monster attack the enemy monster
  def attack(p_monster, e_monster)
    deal, taken = p_monster.attack(e_monster)

    self.player_attack_info(p_monster, e_monster)
  end

  # Helper for attacking
  def player_attack_info(p_monster, e_monster)
    puts "#{@name}'s #{p_monster.name} attacks enemy's #{e_monster.name}, deals #{p_monster.attack_point * 1.0} damage and takes #{e_monster.attack_point * 0.5} damage\n"
  end
  
end