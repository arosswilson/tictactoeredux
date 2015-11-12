class Game
  attr_accessor :board, :rules, :players
  def initialize(args={})
    @board = args[:board] || Board.new({board_size: 3})
    @rules = args[:rules] || Rules.new({board: board})
    @players = args[:players] || []
  end

  def welcome_message
    puts "Welcome to Tic-Tac-Toe!"
  end

  def clear
    puts "\e[H\e[2J"
  end

  def create_players(response)
    case response
    when '1'
      @players = [Human.new, Human.new]
    when '2'
      @players = [Computer.new, Computer.new]
    when '3'
      @players = [Human.new, Computer.new]
    end
  end

  def get_game_type
    response = nil
    response = display_message_and_get_response("Would you like to play \n 1. human v. human \n 2. computer v. computer \n 3. human v. computer \nPlease enter a numerical choice")
    until response == '1' || response == '2' || response == '3'
      response = display_message_and_get_response("Would you like to play \n 1. human v. human \n 2. computer v. computer \n 3. human v. computer \nPlease enter a numerical choice")
    end
    create_players(response)
  end

  def display_message_and_get_response(message)
    puts message
    return gets.chomp
  end

end