class Rules
  def row_check(board = @board)
    board.each do |row|
      return row[0] if row.uniq.length == 1 && !(row.include?('_'))
    end
    nil
  end

end