class PlayerSetup

  def self.run(game)
    update_player_info(game)
    choose_order(game)
  end

  def self.display_message_and_get_response(message)
    puts message
    return gets.chomp
  end

  def self.choose_order(game)
    response =''
    until response == '1' || response == '2'
      response = display_message_and_get_response("Please enter the number for the player that you want to go first: \n 1. #{game.players[0].class} #{game.players[0].marker} \n 2. #{game.players[1].class} #{game.players[1].marker}")
    end
    game.players.reverse! if response == '2'
  end

  def self.update_player_info(game)
    game.players.each_with_index do |player, i|
      puts "For #{player.class.superclass} #{(i+1)}: #{player.class} \n"
      player.get_info(game.players[i-1].marker)
      game.players[i-1].update_op_mrkr(player.marker)
    end
  end

end