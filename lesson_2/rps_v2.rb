class Move
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']

  def to_s
    @value
  end

  def initialize(value)
    @value = value
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
    (rock? && other_move.scissors?) ||
      (rock? && other_move.lizard?) ||
      (paper? && other_move.spock?) ||
      (paper? && other_move.rock?) ||
      (scissors? && other_move.paper?) ||
      (scissors? && other_move.lizard?) ||
      (spock? && other_move.scissors?) ||
      (spock? && other_move.rock?) ||
      (lizard? && other_move.spock?) ||
      (lizard? && other_move.paper?)
  end

  def <(other_move)
    (rock? && other_move.paper?) ||
      (rock? && other_move.spock?) ||
      (paper? && other_move.lizard?) ||
      (paper? && other_move.scissors?) ||
      (scissors? && other_move.spock?) ||
      (scissors? && other_move.rock?) ||
      (spock? && other_move.lizard?) ||
      (spock? && other_move.paper?) ||
      (lizard? && other_move.scissors?) ||
      (lizard? && other_move.rock?)
  end
end

class Player
  attr_accessor :move, :name, :score, :history, :class

  def initialize
    set_name
    @score = 0
    @history = []
  end

  def track_history(move)
    @history << move
  end
end




class Human < Player
  def set_name
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, scissors, lizard, or spock:"
      choice = gets.chomp
      break if Move::VALUES.include? choice
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
    self.history << self.move
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def class?
    if #when chooses rock, loses > 50% of the time
      'simpleton'
    elsif #when chooses spock, wins > 50% of the time
      ''
    elsif # when chooses
  end

  # set choices = to an array, in which the word 'rock' appears 'rock' * weight times. Same for the rest of the possible moves. Then weights can be adjusted each time before a choice needs to be made

  def choose
    self.move = Move.new(Move::VALUES.sample)
    self.history << self.move
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors, Lizard, Spock. Good Bye!"
  end

  def display_moves
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

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, must be y or n."
    end

    return true if answer.downcase == 'y'
    return false if answer.downcase == 'n'
  end

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      increment_score
      puts "#{human.name}: #{human.score} | #{computer.name}: #{computer.score}"
      puts "#{human.name} Won the match!" if human.score >= 10
      puts "#{computer.name} Won the match!" if computer.score >= 10
      break if human.score >= 10 || computer.score >= 10
    end
    display_goodbye_message
  end
end

RPSGame.new.play
