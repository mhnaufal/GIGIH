class Monster
  attr_accessor :name, :attack_point, :hitpoint, :status, :turn, :turn_left, :dot

  def initialize(name, hitpoint, attack_point)
    @name = name
    @hitpoint = hitpoint
    @attack_point = attack_point
    @status = 'none'
    @turn_left = 0
    @dot = 0
  end

  def to_s
    if @hitpoint > 0
      if @status == 'none'
        "#{@name}[#{@hitpoint}]"
      else
        "#{@name}[#{@hitpoint}][#{@status}]"
      end
    else
      "#{@name}[X]"
    end
  end

  # Monster attack
  def attack(e_monster)
    if isFrozen
      puts "#{@name} is frozen state, can't attack"
      return
    else
      damage_taken = take_damage(0.5 * e_monster.attack_point)
      damage_dealt = e_monster.take_damage(@attack_point)
      return damage_dealt, damage_taken
    end
  end

  def isFrozen
    return @status == 'frozen'
  end

  def take_damage(amount)
    @hitpoint -= amount
  end

  # Helper for attacking
  def monster_attack_info(e_monster)
    puts "#{@name} attacks #{e_monster.name}, deals #{@attack_point.to_f} damage and takes #{e_monster.attack_point} damage"
  end

  # The child class monster will run this method every time
  # play turn method get called
  def take_elemental_attack(init_damage, effect, turn, dot)
    take_damage(init_damage)
    @status = effect
    @turn_left = turn
    @dot = dot
  end

  # This method will get run every time a turn is started
  # damage given to the current accessor monster player
  def apply_skill
    if self.turn != 4
      take_damage(@dot)
    end
    @turn_left -= 1

    if @turn_left == 0 or (@turn_left == 1 and self.status == 'burnt')
      @status = 'none'
      @dot = 0
    end
  end

end
