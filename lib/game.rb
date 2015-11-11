class Game
  attr_accessor :board, :rules
  def initialize(args={})
    @board = args[:board] || Board.new({board_size: 3})
    @rules = args[:rules] || Rules.new({board: board})
  end

  def welcome_message
    puts "Welcome to Tic-Tac-Toe!"
  end

end