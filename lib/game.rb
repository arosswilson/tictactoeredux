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
      @players = [Player.new, Player.new]
    when '2'
      @players = [Computer.new, Computer.new]
    when '3'
      @players = [Player.new, Computer.new]
    end
  end

end