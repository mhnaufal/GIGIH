class Player
  attr_reader :cards, :name
  
  def initialize(name, cards = [])
    @name = name
    @cards = cards
  end

  # Add a card into the player list of cards
  def add_card(card=Monster)
    @cards.push(card.dup)
    # @cards << card.dup # == @cards.push()
  end

  # Get current player's cards
  def get_cards
    @cards
  end

  # Print out information about the current Player object
  def info
    inf = "#{@name}:\n"
    @cards.each {
      |card|
        inf = inf + card.to_s + ", "
    }
    inf.delete_suffix!(", ")
    print "#{inf}"
  end

  # Player card attack the enemy card
  # similiar to play_turn from solutions
  def attack(p_card, e_card)
    if p_card.respond_to?(:apply_skill, true)
      print "#{@name}'s "
      deal, taken = p_card.attack(e_card)
      if p_card.respond_to?(:apply_spell, true)
        return
      end
    else
      print "#{@name}'s"
      p_card.apply_spell(e_card)
    end
    
  end

  # Helper for attacking
  def player_attack_info(p_card, e_card)
    puts "#{@name}'s #{p_card.name} attacks enemy's #{e_card.name}, deals #{p_card.attack_point * 1.0} damage and takes #{e_card.attack_point * 0.5} damage\n"
  end
  
  # Activate special skill
  # skill calculated on every cards at a given time
  def cast_special
    @cards.each { |card|
      if card.respond_to?(:apply_skill, true)
        card.apply_skill
      else
        return
      end
    }
  end
  
end