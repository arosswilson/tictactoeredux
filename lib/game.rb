require_relative 'board'
require_relative 'rules'
require_relative 'turn'
require_relative 'gametypesetup'
require_relative 'playersetup'
require_relative 'ShowBoard'
class Game
  attr_accessor :board, :rules, :players, :turn, :keep_playing, :gamesetup, :playersetup
  attr_reader :moves
  def initialize(args={})
    @board = args[:board] || Board.new({board_size: 3})
    @rules = args[:rules] || Rules.new({board: board})
    @gamesetup = GametypeSetup.new
    @playersetup = PlayerSetup.new
    @players = args[:players] || []
    @turn = args[:turn] || Turn.new
    @keep_playing = true
  end

  def run
    get_started
    while keep_playing
      game_loop
      find_winner
      GametypeSetup.play_again?(self)
    end
  end

  def get_started
    players = gamesetup.run
    PlayerSetup.run(self)
  end

  def game_loop
    until rules.game_over?
      move_sequence(players[0])
      break if rules.game_over?
      move_sequence(players[1])
      break if rules.game_over?
    end
  end

  def find_winner
    marker = rules.game_over? if rules.game_over?
    players.each do |player|
      return puts show_winner(player, marker) if show_winner(player, marker)
    end
    ShowBoard.run(board)
    puts'TIE GAME'
  end

  def show_winner(player, marker)
    if marker == player.marker
      ShowBoard.run(board)
      return "Winner: #{player.class} #{player.name}"
    end
  end

  def move_sequence(player)
    ShowBoard.run(board)
    turn.last_move
    turn.take_turn(board, player)
  end

  def display_message_and_get_response(message)
    puts message
    return gets.chomp
  end
end