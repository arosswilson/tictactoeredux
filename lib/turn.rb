require 'pry'
class Turn
  def prompt(player)
    puts "It's your turn #{player.name}. Where would you like to move?"
  end

  def show_available_moves(array)
    array.each{|move| puts move}
  end
end