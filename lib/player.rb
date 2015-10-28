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
    display("It's your turn, #{name}. Please pick from the possible moves The first choice is the row, the second is the column")
    move = disp_and_res(board.possible_moves)
    until board.validate_move(move)
      display("that choice was invalid, please pick a valid choice from the list of possible moves:")
      move = disp_and_res(board.possible_moves)
    end
    board.move(marker, move)
  end
end