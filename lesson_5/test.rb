class Deck
  attr_accessor :game_deck
  SUITS = ['Hearts', 'Spades', 'Clubs', 'Diamonds']
  VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'jack',
            'queen', 'king', 'ace']
  def initialize
    @game_deck = fresh_deck
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

game = Deck.new
p game.game_deck
