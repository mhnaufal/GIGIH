# Ice Monster
# 1st = attack enemy + deal 0.2 * self.attack_point + frozen status
# 2nd = no damage + cant attack  (1)
# 3rd = no damage + frozen end (2)

require_relative 'monster'

class IceMonster < Monster
  attr_accessor :name, :hitpoint, :attack_point, :effect, :turn, :dot

  def initialize(name, hitpoint, attack_point)
    super(name, hitpoint, attack_point)
    @init_damage = 0.8 * @attack_point
    @effect = 'frozen'
    @turn = 1
    @dot = 0
  end

  # Overwrite the attack method
  def attack(e_monster)
    if !isFrozen
      e_monster.take_elemental_attack(@init_damage, @effect, @turn, @dot)
      take_damage(0.5 * e_monster.attack_point)

      monster_attack_info(e_monster)
    else
      puts "#{@name} is in frozen state, can't attack"
    end
  end

  # Overwrite attack info
  def monster_attack_info(e_monster)
    puts "#{@name} uses elemental attack on enemy's #{e_monster.name}, deals #{@init_damage} damage, takes #{0.5 * e_monster.attack_point} damage, inflict #{@effect} status for #{@turn} turns with #{@dot} damage each turn"
  end
  
  # LEGACY
  # # Activate special skill
  # def activate_special(e_monster)
  #   dealt = 0
  #   taken = e_monster.attack_point * 0.5
  #   turn = e_monster.effect_duration = 1
  #   damage = self.attack_point * 0.8

  #   e_monster.status << "frozen"

  #   return dealt, taken, turn, damage
  # end

  # def process_special(e_monster)
  #   if e_monster.effect_duration != 0
  #     e_monster.take_damage(self.attack_point * 0.8)
  #     e_monster.effect_duration -= 1
  #   else
  #     # e_monster.status -= ["frozen"]
  #     e_monster.status.clear
  #   end
  # end
end
