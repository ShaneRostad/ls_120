require "pry"
class Player
  attr_accessor :type, :hand, :total

  VALID_CARDS = ['2', '3', '4', '5', '6', '7', '8', '9', '10']

  def initialize(type)
    @type = type
    @hand = []
    @total = 0
  end

  def hit(deck)
    @hand << deck.pop
  end

  def stay
    'stay'
  end

  def busted?
    total > 21
  end

  def twenty_one_win?
    total == 21
  end

  def two_through_ten(num)
    VALID_CARDS.include?(num)
  end

  def total
    total = 0
    @hand.each do |card|
      if VALID_CARDS.include?(card[0])
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
  attr_accessor :game_deck
  SUITS = ['Hearts', 'Spades', 'Clubs', 'Diamonds']
  VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'jack',
            'queen', 'king', 'ace']
  def initialize
    @game_deck = fresh_deck
  end

  def pop
    @game_deck.pop
  end

  def fresh_deck
    cards = []
    SUITS.each do |suit|
      VALUES.each do |value|
        cards << [value] + [suit]
      end
    end
    cards.shuffle
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

  def deal_gambler_hand
    2.times do
      gambler.hand << deck.pop
    end
  end

  def deal_dealer_hand
    2.times do
      dealer.hand << deck.pop
    end
  end

  def deal_cards
    deal_gambler_hand
    deal_dealer_hand
  end

  def show_initial_cards
    puts ""
    puts "Your cards are: #{format_cards(gambler)}"

    puts ""
    puts "The dealer's cards are: #{format_cards(dealer)[0]}"
    puts ""
  end

  def format_cards(player)
    player.hand.map { |card| card[0] + ' of ' + card[1] }
  end

  def show_current_hand
    puts "Your cards are: #{format_cards(gambler)}"
  end

  def player_pick_move
    choice = nil
    options = ['hit', 'stay']

    loop do
      puts "Would you like to hit or stay?"
      choice = gets.chomp.downcase
      break if options.include?(choice)
      puts "Sorry, please enter hit or stay"
    end
    choice
  end

  def clear
    system('clear') || system('cls')
  end

  def player_turn
    loop do
      choice = player_pick_move

      if choice == 'hit'
        gambler.hit(@deck)
        clear
        show_initial_cards
      elsif choice == 'stay'
        gambler.stay
      end
      break if gambler.busted? || choice == 'stay' || gambler.twenty_one_win?
    end
  end

  def dealer_turn
    return nil if gambler.busted? || gambler.twenty_one_win?
    loop do
      if dealer.total < 17
        dealer.hit(@deck)
      else
        dealer.stay
        break
      end
      break if dealer.twenty_one_win?
      break if dealer.busted?
    end
  end

  def show_dealer_cards
    puts "The dealer's cards are: #{format_cards(dealer)}"
  end

  def show_final_cards
    show_dealer_cards
    puts "Giving the dealer a total of #{dealer.total}"
    puts ""
    show_current_hand
    puts "Giving you a total of #{gambler.total}"
    puts ""
  end

  def dealer_win?
    if dealer.busted?
      puts "The dealer busted! You win!"
    elsif dealer.twenty_one_win?
      puts "The dealer hit 21, you lose."
    elsif dealer.total > gambler.total
      puts "The dealer wins. Better Luck next time!"
    elsif dealer.total == gambler.total
      puts "It's a tie!"
    end
  end

  def gambler_win?
    if gambler.busted?
      puts "You busted! Better luck next time!"
    elsif gambler.twenty_one_win?
      puts "You hit 21! You win!"
    elsif gambler.total > dealer.total
      puts "You win!"
    end
  end

  def show_result
    show_final_cards
    gambler_win?
    dealer_win?
  end

  def reset
    gambler.hand = []
    dealer.hand = []
    @deck = Deck.new
  end

  def play_again?
    response = nil
    loop do
      puts "Would you like to play again? (y/n)"
      response = gets.chomp.downcase
      break if ['y', 'n'].include? response
    end
    response == 'y'
  end

  def start
    loop do
      clear
      deal_cards
      show_initial_cards
      player_turn
      dealer_turn
      system "clear"
      show_result
      play_again? ? reset : break
    end
  end
end

Game.new.start
