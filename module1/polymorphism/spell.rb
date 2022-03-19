# Fire == Burnt

class Spell
  attr_accessor :name, :type

  def initialize(name, type)
    @name = name
    @type = type
  end

  def to_s
    "#{@name}[#{@type}]"
  end

  def apply_spell(e_monster)
    if e_monster.status == 'burnt'
      e_monster.turn_left += 1
      puts " casts #{@name} spell on enemy's #{e_monster.name}"
    end
  end

  def attack(e_monster)
    puts "RUNNN"
    # damage_taken = take_damage(0.5 * e_monster.attack_point)
    # damage_dealt = e_monster.take_damage(@attack_point)
    # return damage_dealt, damage_taken
    return 1, 1
  end
  
end