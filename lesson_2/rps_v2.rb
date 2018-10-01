require "pry"
class Move
  attr_accessor :values

  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']

  WINNING_MOVES = { 'rock' => ['lizard', 'scissors'],
                    'scissors' => ['paper', 'lizard'],
                    'paper' => ['spock', 'rock'],
                    'spock' => ['scissors', 'rock'],
                    'lizard' => ['spock', 'paper'] }

  LOSING_MOVES = { 'rock' => ['paper', 'spock'],
                   'scissors' => ['rock', 'spock'],
                   'paper' => ['lizard', 'scissors'],
                   'spock' => ['paper', 'lizard'],
                   'lizard' => ['scissors', 'spock'] }

  def initialize(choice, name)
    if choice == ''
      if name == 'Edward Scissorhands'
        values = ['scissors', 'scissors', 'scissors', 'scissors', 'rock']
      elsif name == 'Rocky Balboa'
        values = ['rock', 'rock', 'rock', 'rock', 'spock']
      elsif name == 'R2D2'
        values = ['rock', 'paper', 'scissors', 'lizard', 'spock']
      else
        values = ['rock', 'paper', 'scissors', 'lizard', 'spock']
      end
      @value = values.sample
    else
      @value = choice
    end
  end

  def to_s
    @value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def spock?
    @value == 'spock'
  end

  def lizard?
    @value == 'lizard'
  end

  def >(other_move)
    WINNING_MOVES[to_s].include?(other_move.to_s) ||
      WINNING_MOVES[to_s].include?(other_move.to_s) ||
      WINNING_MOVES[to_s].include?(other_move.to_s) ||
      WINNING_MOVES[to_s].include?(other_move.to_s) ||
      WINNING_MOVES[to_s].include?(other_move.to_s)
  end

  def <(other_move)
    LOSING_MOVES[to_s].include?(other_move.to_s) ||
      LOSING_MOVES[to_s].include?(other_move.to_s) ||
      LOSING_MOVES[to_s].include?(other_move.to_s) ||
      LOSING_MOVES[to_s].include?(other_move.to_s) ||
      LOSING_MOVES[to_s].include?(other_move.to_s)
  end
end

class Player
  attr_accessor :move, :name, :score, :history, :class

  def initialize
    set_name
    @score = 0
    @history = []
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty? || n[0] == ' '
      puts "Sorry, must enter a value."
    end
    self.name = n.strip.capitalize
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, scissors, lizard, or spock:"
      choice = gets.chomp.downcase
      break if Move::VALUES.include? choice
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice, '')
    history << move.to_s
  end
end

class Computer < Player
  attr_accessor :choices

  def set_name
    self.name = ['R2D2', 'Hal', 'Rocky Balboa',
                 'Edward Scissorhands', 'Number 2'].sample
  end

  def choose
    self.move = Move.new('', name)
    history << move.to_s
  end
end

class RPSGame
  attr_accessor :human, :computer

  WINNING_SCORE = 10

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    system("clear")
    puts "Hello #{human.name}! Welcome to Rock, Paper, Scissors, Lizard, Spock!"
    puts "The first to 10 points will be declared the winner!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors, Lizard, Spock. Good Bye!"
  end

  def display_moves
    system("clear")
    puts "#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won the round!"
    elsif human.move < computer.move
      puts "#{computer.name} won round!"
    else
      puts "This round's a tie!"
    end
  end

  def increment_score
    if human.move > computer.move
      human.score += 1
    elsif human.move < computer.move
      computer.score += 1
    end
  end

  def match_won?
    if human.score >= WINNING_SCORE
      puts "#{human.name} Won the match!"
      true
    elsif computer.score >= WINNING_SCORE
      puts "#{computer.name} Won the match!"
      true
    end
  end

  def display_score
    puts "#{human.name}: #{human.score} | #{computer.name}: #{computer.score}"
  end

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose

      display_moves
      display_winner
      increment_score
      display_score
      break if match_won?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
