require_relative 'board.rb'
require_relative 'view'
require_relative 'piece'
class Computer < Piece
  attr_accessor :best_move
  def post_initialize(args)
    @best_move
  end

  def default_marker
    nil
  end

  def def_op_marker
    nil
  end

  def def_name
    "Computer"
  end

  def move(board)
    minimax(board,true,)
    board.move(marker, @best_move)
    display("#{self.name} chose #{@best_move}")
    sleep(2)
  end

  private

  def minimax(board, computers_turn, depth = 0)
    return score(board, depth) if board.game_over?
    scores = []
    moves =[]
    board.possible_moves.each do |move|
      moves << move
      if computers_turn
        board.move(marker,move)
        scores << minimax(board, false, depth+1)
      else
        board.move(opponent_marker, move)
        scores << minimax(board, true, depth+1)
      end
      board.undo(move)
    end
    best_move(scores, moves, computers_turn)
  end

  def score(board, depth)
    return 10 - depth if board.game_over? == marker
    return depth - 10 if board.game_over? == opponent_marker
    return 0 if board.game_over? == "tie"
  end

  def best_move(scores, moves, computers_turn)
    if computers_turn
      best_mv_index = scores.each_with_index.max[1]
      @best_move = moves[best_mv_index]
      return scores[best_mv_index]
    else
      worst_mv_index = scores.each_with_index.min[1]
      return scores[worst_mv_index]
    end
  end
end


