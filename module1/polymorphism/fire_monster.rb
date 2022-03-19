# Fire Monster
# 1st = attack enemy + no damage + give burnt status
# 2nd = deal damage 0.4 * self.attack_point  (1)
# 3rd = deal damage 0.4 * self.attack_point  (2)
# 4th = deal damage 0.4 * self.attack_point  (3)
# 5th = burnt end + no damage give

require_relative 'monster'

class FireMonster < Monster
  attr_accessor :name, :hitpoint, :attack_point, :effect, :turn, :dot

  def initialize(name, hitpoint, attack_point)
    super(name, hitpoint, attack_point)
    @init_damage = 0
    @effect = 'burnt'
    @turn = 4
    @dot = 0.4 * @attack_point
  end

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
    puts "#{@name} uses elemental attack on enemy's #{e_monster.name}, deals #{@init_damage} damage, takes #{0.5 * e_monster.attack_point} damage, inflict #{@effect} status for #{@turn-1} turns with #{@dot} damage each turn"
  end

  ## LEGACY
  # Activate special skill
  # def activate_special(e_monster)
  # dealt = 0
  # taken = e_monster.attack_point * 0.5
  # turn = 3
  # e_monster.effect_duration = turn
  # damage = @attack_point * 0.4

  # e_monster.status << "burnt"

  # puts "My #{@name} activate the #{@special} jutsu targeted for enemy's #{e_monster.name}"
  # puts "Status before: #{e_monster.status}"
  # e_monster.status << "burnt" << "burnt" << "burnt"
  # puts "Status after: #{e_monster.status}"
  # return dealt, taken, turn, damage
  # end
end
