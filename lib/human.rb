require_relative 'player'
class Human < Player

  def default_marker
    "X"
  end

  def def_op_marker
    "O"
  end

  def def_name
    "Human"
  end
end