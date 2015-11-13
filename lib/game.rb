require_relative 'board'
require_relative 'rules'
require_relative 'turn'
require_relative 'gametypesetup'
require_relative 'playersetup'
class Game
  attr_accessor :board, :rules, :players, :turn, :keep_playing
  attr_reader :moves
  def initialize(args={})
    @board = args[:board] || Board.new({board_size: 3})
    @rules = args[:rules] || Rules.new({board: board})
    @players = args[:players] || []
    @turn = args[:turn] || Turn.new
    @keep_playing = true
  end

  def run
    get_started
    while keep_playing
      game_loop
      find_winner
      play_again?
    end
  end

  def get_started
    GametypeSetup.run(self)
    PlayerSetup.run(self)
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
        return puts"Winner: #{player.class} #{player.name}"
      end
    end
    puts'TIE GAME'
  end

  def move_sequence(player)
    clear
    show_board
    turn.last_move
    turn.take_turn(board, player)
  end

  def show_board
    puts board.to_s
  end

  def clear
    puts "\e[H\e[2J"
  end

  def play_again?
    res = display_message_and_get_response("want to play again? Please enter 'Y' or 'N'").downcase
    until res == "y" || res == "n"
      res = display_message_and_get_response("invalid response, please enter 'Y' or 'N'.").downcase
    end
    end_game?(res)
  end

  def end_game?(response)
    if response == 'n'
      @keep_playing = false
    else
      start_new_game_loop
    end
  end

  def display_message_and_get_response(message)
    puts message
    return gets.chomp
  end

  def start_new_game_loop
    @board = Board.new
    @rules = Rules.new({board: @board})
    @turn = Turn.new
  end
end