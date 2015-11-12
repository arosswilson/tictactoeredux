require 'pry'
class Turn
  attr_accessor :users_move
  attr_reader :player
  def initialize
    @users_move = nil
    @player = nil
  end
  def prompt(player)
    puts "It's your turn #{player.name}. Where would you like to move?"
  end

  def prompt_again
    puts "That move isn't an available move, please pick a move from the list"
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

  def take_turn(moves, player)
    @player = player
    prompt(player)
    show_available_moves(moves)
    get_users_move
    until verify_move_is_available(moves)
      prompt_again
      show_available_moves(moves)
      get_users_move
    end
  end

  def last_move
    if player && users_move
      puts "#{player.name} chose #{users_move}"
    end
  end
end