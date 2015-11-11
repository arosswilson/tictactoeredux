class Rules
  attr_reader :board, :board_arr
  def initialize(args={})
    @board = args[:board]
    @board_arr = @board.board
  end

  def row_check(board_arr = @board_arr)
    board_arr.each do |row|
      return row[0] if row.uniq.length == 1 && !(row.include?('_'))
    end
    nil
  end

  def col_check
    row_check(@board_arr.transpose)
  end

end