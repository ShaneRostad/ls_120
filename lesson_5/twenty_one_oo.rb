class Player
  attr_accessor :type, :hand, :total

  def initialize(type)
    @type = type
    @hand = []
    @total = 0
    #thinking the player and Dealer will both have cards
    # what would the "data" or "states" of a Player object entail?
    # maybe cards? a name?
  end

  def hit(deck)
    @hand << [deck.values.sample] + [deck.suits.sample]
  end

  def stay
    nil
  end

  def busted?
    total > 21
  end

  def total
    total = 0

    @hand.each do |card|
      if %w(2 3 4 5 6 7 8 9 10).include?(card[0])
        total += card[0].to_i
      elsif card[0] == 'ace'
        total += 11
      else
        total += 10
      end
    end

    @hand.select { |card| card[0] == 'ace' }.count.times do
      total -= 10 if total > 21
    end

    total
  end

end


class Deck
  attr_reader :suits, :values

  def initialize
    @suits = ['Hearts', 'Spades', 'Clubs', 'Diamonds']
    @values = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'jack',
               'queen', 'king', 'ace']
  end
end

class Card
  def initialize
    # what are the "states" of a card?
  end
end

class Game
  attr_accessor :deck, :gambler, :dealer

  def initialize
    @deck = Deck.new
    new_gambler
    new_dealer
  end

  def new_gambler
    @gambler = Player.new('gambler')
  end

  def new_dealer
    @dealer = Player.new('dealer')
  end

  def deal_cards
    2.times do
      gambler.hand << [deck.values.sample] + [deck.suits.sample]
      dealer.hand << [deck.values.sample] + [deck.suits.sample]
    end
  end

  def show_initial_cards
    puts ""
    puts "Your cards are: #{gambler.hand.map { |set| set[0] + ' of ' + set[1] }}"
    puts ""
    puts "The dealer's cards are: #{dealer.hand[0][0] + ' of ' + dealer.hand[0][1] }"
    puts ""
  end

  def show_current_hand
    puts "Your cards are: #{gambler.hand.map { |set| set[0] + ' of ' + set[1] }}"
  end

  def player_turn

    loop do
      choice = nil
      loop do
        puts "Would you like to hit or stay?"
        choice = gets.chomp
        break if %w(hit stay).include? choice
        puts "Sorry, please enter hit or stay"
      end

      if choice == 'hit'
         gambler.hit(@deck)
         show_current_hand
      elsif choice == 'stay'
         gambler.stay
         break
      end
      break if gambler.busted? || choice == 'stay'
    end
  end

  def dealer_turn
    return nil if gambler.busted?
    loop do
      if dealer.total < 17
        dealer.hit(@deck)
      else
        dealer.stay
        break
      end

      break if dealer.busted?
    end
  end

  def show_dealer_cards
    puts "The dealer's cards are: #{dealer.hand.map { |set| set[0] + ' of ' + set[1] }}"
  end

  def show_final_cards
    show_dealer_cards
    puts "Giving the dealer a total of #{dealer.total}"
    puts ""
    show_current_hand
    puts "Giving you a total of #{gambler.total}"
    puts ""
  end

  def show_result
    show_final_cards
    if gambler.busted?
      puts "You busted! Better luck next time!"
    elsif dealer.busted?
      puts "The dealer busted! You win!"
    elsif gambler.total > dealer.total
      puts "You win!"
    else
      puts "Sorry, the dealer won!"
    end
  end

  def start
    deal_cards
    show_initial_cards
    player_turn
    dealer_turn
    system "clear"
    show_result
  end
end

Game.new.start
