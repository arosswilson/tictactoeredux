require 'pry'
class Turn
  attr_accessor :users_move
  def initialize
    @users_move = ''
  end
  def prompt(player)
    puts "It's your turn #{player.name}. Where would you like to move?"
  end

  def show_available_moves(moves)
    moves.each{|move| puts move}
  end

  def get_users_move
    move = gets.chomp
    @users_move = move
  end

  def verify_move_is_available(moves)
    moves.include? @users_move
  end
end