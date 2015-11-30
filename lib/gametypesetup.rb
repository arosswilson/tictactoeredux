require_relative 'human'
require_relative 'computer'
class GametypeSetup

  def run
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

  def create_players(response)
    case response
    when '1'
      [Human.new, Human.new]
    when '2'
      [Computer.new, Computer.new]
    when '3'
      [Human.new, Computer.new]
    end
  end

  def get_game_type
    response = nil
    response = display_message_and_get_response("Would you like to play \n 1. human v. human \n 2. computer v. computer \n 3. human v. computer \nPlease enter a numerical choice")
    until response == '1' || response == '2' || response == '3'
      response = display_message_and_get_response("Would you like to play \n 1. human v. human \n 2. computer v. computer \n 3. human v. computer \nPlease enter a numerical choice")
    end
    create_players(response)
  end

  def display_message_and_get_response(message)
    puts message
    return gets.chomp
  end
end