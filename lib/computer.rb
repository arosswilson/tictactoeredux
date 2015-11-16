require_relative 'board.rb'
require_relative 'player'
class Computer < Player
  attr_accessor :rules, :opponent_marker
  def post_initialize(args)
    @rules = Rules.new
    @opponent_marker = args[:opponent_marker] || def_op_marker
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
    update_rules(board)
    minimax(board,true)
  end

  private

  def update_rules(board)
    @rules.board_obj = board
    @rules.board = board.board
  end

  def minimax(board, computers_turn, depth = 0)
    return score(board, depth) if rules.game_over?
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
    return 10 - depth if rules.game_over? == marker
    return depth - 10 if rules.game_over? == opponent_marker
    return 0 if rules.game_over? == "tie"
  end

  def best_move(scores, moves, computers_turn)
    if computers_turn
      best_mv_index = scores.each_with_index.max[1]
      @last_move = moves[best_mv_index]
      return scores[best_mv_index]
    else
      worst_mv_index = scores.each_with_index.min[1]
      return scores[worst_mv_index]
    end
  end
end


