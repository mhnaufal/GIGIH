# require_relative 'your_class_here', add other require_relative as necessary

require_relative 'monster'
require_relative 'player'
require_relative 'fire_monster'
require_relative 'ice_monster'
require_relative 'spell'

phpkachu = Monster.new('Phpkachu', 120, 50)
sqlrtle = IceMonster.new('Sqlrtle', 180, 20)
cppmander = FireMonster.new('Cppmander', 100, 80)
bashtoise = IceMonster.new('Bashtoise', 120, 60)
torterraform = Monster.new('Torterraform', 200, 10)

# WHYYY are you decreasing???
cppmander2 = FireMonster.new('Cppmander', 100, 80)

flamethrower = Spell.new('Flamethrower', 'fire')

player1 = Player.new('Player 1')
player1.add_card(sqlrtle)
player1.add_card(cppmander)
player1.add_card(flamethrower)

player2 = Player.new('Player 2')
player2.add_card(phpkachu)
player2.add_card(cppmander2)
player2.add_card(bashtoise)


puts '=======================Turn 1======================='
puts ''

puts player1.info
puts ''

puts player2.info
puts ''

# Play turn
player1.attack(player1.get_cards[1], player2.get_cards[2])
puts ''

puts player1.info
puts ''

puts player2.info
puts ''

player2.attack(player2.get_cards[1], player1.get_cards[0])
puts ''

puts player1.info
puts ''

puts player2.info
puts ''

puts '=======================Turn 2======================='
puts ''

# starting in turn 2, in the beginning of each turn, apply elemental effects to players' monsters here

player1.cast_special
player2.cast_special

puts player1.info
puts ''

puts player2.info
puts ''

# CAST SPELL HERE!
# player1[2](flame) cast on player2[2] (Bashtoise)
player1.attack(player1.get_cards[2], player2.get_cards[2])
# player2.attack(player2.get_cards[2], player1.get_cards[2]) # Card can't attack
puts ''

puts player1.info
puts ''

puts player2.info
puts ''

# Skipped
# player2.attack(player2.get_cards[2], player1.get_cards[1])
# puts ''

# puts player1.info
# puts ''

# puts player2.info
# puts ''

# We skip Player 2's turn to demonstrate that 
# because Player 1 attacks Player 2's Bashtoise with flamethrower in this turn,
# Player 2's Bashtoise burnt status will continue to turn 4
# While Player 1's Sqlrtle burnt status will stop in turn 3

puts '=======================Turn 3======================='
puts ''

player1.cast_special
player2.cast_special

puts player1.info
puts ''

puts player2.info
puts ''

puts '=======================Turn 4======================='
puts ''

player1.cast_special
player2.cast_special

puts player1.info
puts ''

puts player2.info
puts ''

puts '=======================Turn 5======================='
puts ''

player1.cast_special
player2.cast_special

puts player1.info
puts ''

puts player2.info
puts ''