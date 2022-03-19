#main.tb

require_relative 'monster'
require_relative 'player'

phpkachu = Monster.new('Phpkachu', 80, 50)
sqlrtle = Monster.new('Sqlrtle', 100, 20)
cppmander = Monster.new('Cppmander', 40, 80)
bashtoise = Monster.new('Bashtoise', 60, 60)
torterraform = Monster.new('Torterraform', 120, 10)

phpkachu2 = Monster.new('Phpkachu', 80, 50)
sqlrtle2 = Monster.new('Sqlrtle', 100, 20)
cppmander2 = Monster.new('Cppmander', 40, 80)
bashtoise2 = Monster.new('Bashtoise', 60, 60)
torterraform2 = Monster.new('Torterraform', 120, 10)

monsters = [phpkachu, sqlrtle, cppmander, bashtoise, torterraform]

# monsters.each do |monster|
#   puts monster
# end

# phpkachu.attack(cppmander)

### Homework

# Instantiate the objects of the class that model your players here
player1 = Player.new('Player 1', [phpkachu, cppmander, torterraform])
player2 = Player.new('Player 2', [sqlrtle2, cppmander2, bashtoise2])

# Add monsters to your players here
## Player 1 should have phpkachu, cppmander, and torterraform
# p1 = player1.add_monster(phpkachu)
# p1 = player1.add_monster(cppmander)
# p1 = player1.add_monster(torterraform)

## Player 2 should have sqlrtle, cppmander, and bashtoise
# p2 = player2.add_monster(sqlrtle2)
# p2 = player2.add_monster(cppmander2)
# p2 = player2.add_monster(bashtoise2)

# Init each players
puts player1.info
puts player2.info

# Game starts

# player1.attack(player1.get_monsters[0], player2.get_monsters[1])
# puts ''
# puts player1.info
# puts player2.info

puts '=======================Turn 1======================='
puts ''

player1.attack(player1.get_monsters[0], player2.get_monsters[1])
puts ''
puts player1.info
puts player2.info

player2.attack(player2.get_monsters[0], player1.get_monsters[1])
puts ''
puts player1.info
puts player2.info

# Loop until a player loses their monsters

# game_on = true
# game_round = 0

# while game_on
#   puts '=======================Turn #{game_round + 1}======================='
#   puts ''
  
#   player2.attack(player2.get_monsters[game_round], player1.get_monsters[game_round])
#   puts ''
#   puts player1.info
#   puts player2.info
  
#   if player1.live <= 0 || player2.live <= 0
    # game_on = false
#   end
# end

# # Print the current stats of each players here
# player1.info
# puts ''
# player2.info

# puts ''
# puts '=======================Turn 1======================='
# puts ''

# # Make your Player 1's phpkachu attacks Player 2's cppmander here
# player1.attack(p1[0], p2[1])
# puts ''

# # Print the current stats of each players here
# player1.info
# puts ''
# player2.info

# # Make your Player 2's phpkachu attacks Player 1's cppmander here
# puts ''
# player2.attack(p2[0], p1[1])
# puts ''

# # Print the current stats of each players here
# player1.info
# puts ''
# player2.info