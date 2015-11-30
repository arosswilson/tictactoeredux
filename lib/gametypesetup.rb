require_relative 'human'
require_relative 'computer'
class GametypeSetup

  def self.run(game)
    clear
    welcome_message
    get_game_type(game)
  end

  def welcome_message
    puts "Welcome to Tic-Tac-Toe!"
  end

  def clear
    puts "\e[H\e[2J"
  end

  def self.create_players(response, game)
    case response
    when '1'
      game.players = [Human.new, Human.new]
    when '2'
      game.players = [Computer.new, Computer.new]
    when '3'
      game.players = [Human.new, Computer.new]
    end
  end

  def self.get_game_type(game)
    response = nil
    response = display_message_and_get_response("Would you like to play \n 1. human v. human \n 2. computer v. computer \n 3. human v. computer \nPlease enter a numerical choice")
    until response == '1' || response == '2' || response == '3'
      response = display_message_and_get_response("Would you like to play \n 1. human v. human \n 2. computer v. computer \n 3. human v. computer \nPlease enter a numerical choice")
    end
    create_players(response, game)
  end

  def self.display_message_and_get_response(message)
    puts message
    return gets.chomp
  end

  def self.start_new_game_loop(game)
    game.board = Board.new
    game.rules = Rules.new({board: game.board})
    game.turn = Turn.new
  end

  def self.end_game?(response, game)
    if response == 'n'
      game.keep_playing = false
    else
      start_new_game_loop(game)
    end
  end

  def self.play_again?(game)
    res = display_message_and_get_response("want to play again? Please enter 'Y' or 'N'").downcase
    until res == "y" || res == "n"
      res = display_message_and_get_response("invalid response, please enter 'Y' or 'N'.").downcase
    end
    end_game?(res, game)
  end

end