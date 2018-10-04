class Board
  attr_accessor :squares

  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]

  FULL_ROW = 3

  def initialize
    @squares = {}
    reset
  end
  # rubocop:disable Metrics/AbcSize

  def draw
    puts "     |     |     "
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}  "
    puts "     |     |     "
    puts "-----+-----+-----"
    puts "     |     |     "
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}  "
    puts "     |     |     "
    puts "-----+-----+-----"
    puts "     |     |     "
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}  "
    puts "     |     |     "
  end
  # rubocop:enable Metrics/AbcSize

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  # returns winning marker or nil
  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def best_opening_move
    square = nil
    if @squares[5].marker == Square::INITIAL_MARKER
      square = 5
    end
    square
  end

  def select_square(line, player)
    line.select { |sq| @squares[sq].marker != player.marker }.first
  end
  # rubocop:disable Metrics/LineLength

  def count_player_markers_on_line(line, player)
    @squares.values_at(*line).select(&:marked?).collect(&:marker).count(player.marker)
  end
  # rubocop:enable Metrics/LineLength

  def make_best_move(line, player)
    if count_player_markers_on_line(line, player) == 2
      square = select_square(line, player)
      return square if @squares[square].unmarked?
    end
  end

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != FULL_ROW
    markers.min == markers.max
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end
end

class Square
  INITIAL_MARKER = " "

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def marked?
    marker != INITIAL_MARKER
  end

  def unmarked?
    marker == INITIAL_MARKER
  end
end

class Player
  attr_accessor :score, :name, :marker

  def initialize(name, marker)
    @name = name
    @marker = marker
    @score = 0
  end
end

class TTTGame
  attr_accessor :board, :human, :computer, :turn_counter

  WINNING_SCORE = 5

  @turn_counter = nil

  def initialize
    @board = Board.new
    human_player
    computer_player
    @turn_counter = 0
  end

  def computer_player
    marker = 'X' if human.marker.upcase == 'O'
    marker = 'O' if human.marker.upcase == 'X'
    @computer = Player.new('R2D2', marker)
  end

  def human_player
    name = nil
    loop do
      puts "Please enter your name: "
      name = gets.chomp.capitalize
      break unless name.empty? || name[0] == ' '
      puts "please enter a name."
    end

    marker = nil
    loop do
      puts "Please Choose your marker: (x or o)"
      marker = gets.chomp.upcase
      break if ['X', 'O'].include?(marker)
    end
    @human = Player.new(name, marker)
  end

  def display_score
    puts "#{human.name} has #{human.score} points"
    puts "#{computer.name} has #{computer.score} points"
  end

  def match_over?
    board.someone_won? || board.full?
  end

  def play
    display_welcome_message

    loop do
      display_board
      loop do
        current_player_moves
        break if match_over?
        clear_screen_and_display_board if human_turn?
      end
      display_result
      display_score
      break if match_win? || next_round? == false
      reset
    end
    display_goodbye_message
  end

  def display_welcome_message
    clear
    puts "Welcome to Tic Tac Toe!"
    puts "The first player to win #{WINNING_SCORE} games is the winner!"
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def display_board
    puts "#{human.name}: #{human.marker}. #{computer.name}: #{computer.marker}."
    puts ""
    board.draw
    puts ""
  end

  def human_turn?
    turn_counter.even?
  end

  def joinor(array, delimiter=',', combinor='or')
    case array.size
    when 0 then ''
    when 1 then array.first
    when 2 then array.join(" #{word} ")
    else
      array[-1] = "#{combinor} #{array.last}"
      array.join(delimiter + ' ')
    end
  end

  def current_player_moves
    if human_turn?
      human_moves
    else
      computer_moves
    end
    @turn_counter += 1
  end

  def human_moves
    puts "Choose a square from #{board.unmarked_keys.join(', ')}"
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end

    board[square] = human.marker
  end

  def computer_moves
    square = nil

    square = board.best_opening_move

    if !square
      Board::WINNING_LINES.each do |line|
        square = board.make_best_move(line, computer)
        break if square
        square = board.make_best_move(line, human)
        break if square
        square = board.unmarked_keys.sample
      end
    end

    board[square] = computer.marker
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker
      puts "You won!"
      human.score += 1
    when computer.marker
      puts "Computer won!"
      computer.score += 1
    else
      puts "It's a tie!"
    end
  end

  def match_win?
    human.score == WINNING_SCORE || computer.score == WINNING_SCORE
  end

  def next_round?
    answer = nil
    loop do
      puts "Are you ready for the next round?(y/n)"
      answer = gets.chomp.downcase
      break if ['y'].include? answer
      puts "Alright, just type 'y' when you're ready to start the next round!"
      puts "or type 'quit' to exit the game"
      return false if answer.downcase == 'quit'
    end

    answer == 'y'
  end

  def clear
    system('clear') || system('cls')
  end

  def reset
    board.reset
    clear
    puts "Let's play again!"
    puts ""
    @turn_counter = 0
  end
end

# we'll kick off the game like this
game = TTTGame.new

game.play
