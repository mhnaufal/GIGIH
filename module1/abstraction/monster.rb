#monster.tb

class Monster
  attr_reader :name, :attack_point, :hitpoint
  
  def initialize(name, hitpoint, attack_point)
    @name = name
    @hitpoint = hitpoint
    @attack_point = attack_point
  end

  def to_s
    if @hitpoint > 0
      "#{@name}[#{@hitpoint}]"
    else
      "#{@name}[X]"
    end
  end

  # Monster attack
  def attack(monster)   
    damage_taken = self.take_damage(0.5 * monster.attack_point)
    damage_dealt = monster.take_damage(@attack_point)

    # self.monster_attack_info(monster)
     
    return damage_dealt, damage_taken
  end

  def take_damage(amount)
    @hitpoint -= amount
  end

  # Helper for getting HP
  def get_hp
    return @hitpoint
  end

  # Helper for attacking
  def monster_attack_info(monster)
    puts "#{@name} attacks #{monster.name}, deals #{monster.attack_point.to_f} damage and takes #{monster.attack_point} damage"
  end

  # Method set_hp not longer used
  # because it has same purpose w/
  # method take_damage
  # def set_hp(damage)
  #   @hitpoint -= damage
  # end
end