class Player
  attr_accessor :marker, :name, :last_move
  def initialize(args={})
    @marker = args[:marker] || default_marker
    @name = args[:name] || def_name
    @last_move = nil
    post_initialize(args)
  end

  def post_initialize(args)
    nil
  end

  def default_marker
    raise NotImplementedError
      "This #{self.class} cannot respond to:"
  end

  def def_name
    raise NotImplementedError
      "This #{self.class} cannot respond to:"
  end
end