class Rules
  attr_accessor :board_obj, :board
  def initialize(args={})
    @board_obj = args[:board] || Board.new
    @board = @board_obj.board
  end

  def game_over?
    game_over ||= row_check
    game_over ||= col_check
    game_over ||= diag_check
    game_over ||= tie_check
    game_over
  end

  def row_check(board = @board)
    board.each do |row|
      return row[0] if row.uniq.length == 1 && !(row.include?('_'))
    end
    nil
  end

  def col_check
    row_check(@board.transpose)
  end

  def diag_check
    diag_one = (0...3).collect{|i| board[i][i]}
    diag_two = (1..3).collect{|i| board[-i][(i-1)]}
    return diag_one[0] if diag_one.uniq.length == 1 && !(diag_one.include?('_'))
    return diag_two[0] if diag_two.uniq.length == 1 && !(diag_two.include?('_'))
  end

  def tie_check
    return "tie" if !(board.flatten.include?('_'))
  end

end