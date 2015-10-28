require_relative 'view'
require_relative 'player'
require_relative 'board'
require_relative 'computer'
class Controller
  include View
  attr_reader :player, :computer, :board
  attr_accessor :keep_playing, :players
  def initialize(args={})
    @players = args[:players] || []
    @board = args[:board]
    @keep_playing = true
  end

  def run
    init
    while keep_playing
      new_board?
      game_loop
      final_board
      find_winner
      play_again?
    end
  end

  private

  def get_game_type
    response = nil
    response = disp_and_res("Would you like to play \n 1. human v. human \n 2. computer v. computer \n 3. human v. computer \nPlease enter a numerical choice")
    until response == '1' || response == '2' || response == '3'
      response = disp_and_res("Would you like to play \n 1. human v. human \n 2. computer v. computer \n 3. human v. computer \nPlease enter a numerical choice")
    end
    create_players(response)
  end

  def choose_order
    response =''
    until response == '1' || response == '2'
      response = disp_and_res("Please enter the number for the player that you want to go first: \n 1. #{players[0].class} #{players[0].marker} \n 2. #{players[1].class} #{players[1].marker}")
    end
    players.reverse! if response == '2'
  end

  def move(player)
    clear
    show_board(@board)
    player.move(@board)
  end

  def init
    clear
    welcome
    get_game_type
    update_player_info
    choose_order
  end

  def find_winner
    marker = board.game_over? if board.game_over?
    players.each do |player|
      if marker == player.marker
        return display("Winner: #{player.class} #{player.name}")
      end
    end
    display('tie')
  end

  def update_player_info
    players.each_with_index do |player, i|
      display("For #{player.class} #{i+1} \n")
      player.get_info(players[i-1].marker)
      players[i-1].update_op_mrkr(player.marker)
    end
  end

  def final_board
    clear
    show_board(@board)
  end

  def create_players(response)
    case response
    when '1'
      @players = [Player.new, Player.new]
    when '2'
      @players = [Computer.new, Computer.new]
    when '3'
      @players = [Player.new, Computer.new]
    end
  end

  def game_loop
    until board.game_over?
      players.each do |player|
        move(player)
        break if board.game_over?
      end
    end
  end

  def play_again?
    res = disp_and_res("want to play again? Please enter 'Y' or 'N'").downcase
    until res == "y" || res == "n"
      res = disp_and_res("invalid response, please enter 'Y' or 'N'.").downcase
    end
    @keep_playing = false if res == 'n'
  end

  def new_board?
    if board.game_over?
      @board = Board.newboard(board)
    end
  end
end