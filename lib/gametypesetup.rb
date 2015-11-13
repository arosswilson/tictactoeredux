require_relative 'human'
require_relative 'computer'
class GametypeSetup #consider extracting update player info and choose order to a player setup class

  def self.run(game)
    clear
    welcome_message
    get_game_type(game)
  end

  def self.welcome_message
    puts "Welcome to Tic-Tac-Toe!"
  end

  def self.clear
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
end