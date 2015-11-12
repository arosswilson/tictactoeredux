class Game
  attr_accessor :board, :rules, :players
  def initialize(args={})
    @board = args[:board] || Board.new({board_size: 3})
    @rules = args[:rules] || Rules.new({board: board})
    @players = args[:players] || []
  end



end