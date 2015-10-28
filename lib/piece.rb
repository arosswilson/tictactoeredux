class Piece
  include View
  attr_accessor :marker, :opponent_marker, :name
  def initialize(args={})
    @marker = args[:marker] || default_marker
    @opponent_marker = args[:opponent_marker] || def_op_marker
    @name = args[:name] || def_name
    post_initialize(args)
  end

  def post_initialize(args)
    nil
  end

  def default_marker
    raise NotImplementedError
      "This #{self.class} cannot respond to:"
  end

  def def_op_marker
    raise NotImplementedError
      "This #{self.class} cannot respond to:"
  end

  def def_name
    raise NotImplementedError
      "This #{self.class} cannot respond to:"
  end

  def get_info(other_player_marker = nil)
    get_name
    get_marker(other_player_marker)
  end

  def update_op_mrkr(marker)
    @opponent_marker = marker
  end

  private

  def get_name
    @name = disp_and_res("What's your name for #{self.class}?")
  end

  def get_marker(other_player_marker = nil)
    @opponent_marker = other_player_marker if other_player_marker
    @marker = disp_and_res("What would you like your #{self.class} marker to be (ie 'X')?")
    until @marker.length == 1 && @marker != other_player_marker
      @marker = disp_and_res("What would you like your marker to be (ie 'X')? It can only be one character long, and it can't be the same as the other player's")
    end
  end
end