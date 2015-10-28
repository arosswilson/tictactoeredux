require_relative 'piece'
class Player < Piece

  def default_marker
    "X"
  end

  def def_op_marker
    "O"
  end

  def def_name
    "Player"
  end

  def move(board)
    display("It's your turn, #{name}. Please pick from the possible moves \nThe first choice is the row, the second is the column")
    @last_move = disp_and_res(board.possible_moves)
    until board.validate_move(@last_move)
      display("that choice was invalid, please pick a valid choice from the list of possible moves:")
      @last_move = disp_and_res(board.possible_moves)
    end
    board.move(marker, @last_move)
  end
end