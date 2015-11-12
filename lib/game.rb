require_relative 'board'
require_relative 'rules'
require_relative 'turn'
require_relative 'gametypesetup'
class Game
  attr_accessor :board, :rules, :players, :turn
  attr_reader :moves
  def initialize(args={})
    @board = args[:board] || Board.new({board_size: 3})
    @moves = @board.possible_moves
    @rules = args[:rules] || Rules.new({board: board})
    @players = args[:players] || []
    @turn = args[:turn] || Turn.new
  end

  def run
    get_started
    game_loop
    find_winner
  end

  def get_started
    GametypeSetup.run(self)
  end

  def game_loop
    until rules.game_over?
      players.each do |player|
        move_sequence(player)
        break if rules.game_over?
      end
    end
  end

  def find_winner
    marker = board.game_over? if board.game_over?
    players.each do |player|
      if marker == player.marker
        return display("Winner: #{player.class} #{player.name}")
      end
    end
    display('TIE GAME')
  end

  def move_sequence(player)
    clear
    show_board
    turn.last_move
    turn.take_turn(moves, player)
  end

  def show_board
    puts board.to_s
  end

  def clear
    puts "\e[H\e[2J"
  end

end

game = Game.new
game.run