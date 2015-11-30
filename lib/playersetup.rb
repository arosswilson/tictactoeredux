class PlayerSetup

  def self.run(game)
    update_player_info(game)
    choose_order(game)
    update_opponent_marker_for_computers(game)
  end

  def display_message_and_get_response(message)
    puts message
    return gets.chomp
  end

  def choose_order(players)
    response =''
    until response == '1' || response == '2'
      response = display_message_and_get_response("Please enter the number for the player that you want to go first: \n 1. #{players[0].class} #{players[0].marker} \n 2. #{players[1].class} #{players[1].marker}")
    end
    players.reverse! if response == '2'
  end

  def self.update_player_info(game)
    markers=[]
    game.players.each_with_index do |player, i|
      puts "For #{player.class.superclass} #{(i+1)}: #{player.class} \n"
      get_name(player)
      get_marker(player, markers)
      markers << player.marker
    end
  end

  def self.update_opponent_marker_for_computers(game)
    game.players.each.with_index do |player, i|
      if player.class == Computer
        player.opponent_marker = game.players[i-1].marker
      end
    end
  end

  def self.get_name(player)
    player.name = display_message_and_get_response("What's the name for #{player.class}?")
  end

  def self.get_marker(player, markers=[])
    player.marker = display_message_and_get_response("What would you like your #{self.class} marker to be (ie 'X')?")
    until player.marker.length == 1 && !markers.include?(player.marker)
      player.marker = display_message_and_get_response("What would you like your marker to be (ie 'X')? It can only be one character long, and it can't be the same as the other player's")
    end
  end

end