class Board
  attr_accessor :board
  attr_reader :board_size
  def initialize(args={})
    @board_size = args[:board_size] || 3
    @board = args[:board] || Array.new(@board_size){Array.new(@board_size,'_')}
  end

  def possible_moves
    possible_moves = stringify_spaces_on_board
    return remove_nils(possible_moves)
  end

  def stringify_spaces_on_board
    possible_moves = []
    @board.each.with_index do |row, c_num|
      iterate_through_spaces_in_a_row(row, c_num, possible_moves)
    end
    possible_moves
  end

  def stringify_column_and_row_if_space_is_blank(column, row, space)
    return "#{column.to_s},#{row.to_s}" if space =="_"
  end

  def iterate_through_spaces_in_a_row(row, column, array)
    row.each.with_index {|space, r_num| array << stringify_column_and_row_if_space_is_blank(column, r_num, space)}
  end

  def remove_nils(possible_moves)
    possible_moves.delete(nil)
    possible_moves
  end

  def self.newboard(board)
    return Board.new({board_size: board.board_size})
  end

  def move(marker, position)
    x,y = sanitize_position(position)
    return nil if board[x][y] !='_'
    board[x][y] = marker
  end

  def undo(move)
    x,y = sanitize_position(move)
    board[x][y] = "_"
  end


  def validate_move(move)
    possible_moves.include?(move)
  end

  def to_s
    top_row = create_the_top_display_row
    display = add_additional_board_rows(top_row)
    return display
  end

  def create_the_top_display_row
    " " +('0'...(board_size.to_s)).to_a.join(' ') + "\n"
  end

  def add_additional_board_rows(top_row)
    board.each.with_index do |row, i|
      top_row += (i.to_s + row.join("|")+ "\n")
    end
    top_row
  end

  private

  def sanitize_position(position)
    pos_array = position.split(',')
    pos_array.map!{|cord| cord.to_i}
    return pos_array
  end

  def col_check
    row_check(@board.transpose)
  end

  def diag_check
    diag_one = (0...board_size).collect{|i| board[i][i]}
    diag_two = (1..board_size).collect{|i| board[-i][(i-1)]}
    return diag_one[0] if diag_one.uniq.length == 1 && !(diag_one.include?('_'))
    return diag_two[0] if diag_two.uniq.length == 1 && !(diag_two.include?('_'))
  end

  def tie?
    return "tie" if !(board.flatten.include?('_'))
  end

  def row_check(board = @board)
    board.each do |row|
      return row[0] if row.uniq.length == 1 && !(row.include?('_'))
    end
    nil
  end
end