require_relative 'spec_helper'

describe PlayerSetup do
  let(:game) {Game.new}
  let(:human) {Human.new}
  let(:playersetup) {PlayerSetup.new}
  it "should change the order of the players based on user input" do
    allow(game.gamesetup).to receive(:gets).and_return("3")
    allow(playersetup).to receive(:gets).and_return("2")
    game.players = game.gamesetup.get_game_type
    playersetup.choose_order(game.players)
    expect(game.players[0]).to be_a(Computer)
    expect(game.players[1]).to be_a(Human)
  end

  it "should get player info for each player" do
    allow(game.gamesetup).to receive(:display_message_and_get_response).and_return("1")
    game.players = game.gamesetup.get_game_type
    allow(playersetup).to receive(:display_message_and_get_response).and_return("Ross","V","Miles","O")
    playersetup.update_player_info(game.players)
    expect(game.players[0]).to be_a(Human)
    expect(game.players[1]).to be_a(Human)
    expect(game.players[0].name).to eq("Ross")
    expect(game.players[1].name).to eq("Miles")
  end

  it "should update opponent marker for computers" do
    allow(game.gamesetup).to receive(:display_message_and_get_response).and_return("3")
    game.players = game.gamesetup.get_game_type
    allow(playersetup).to receive(:display_message_and_get_response).and_return("Ross","V","Miles","O", "1")
    game.playersetup.run(game.players)
    expect(game.players[0]).to be_a(Human)
    expect(game.players[1]).to be_a(Computer)
    expect(game.players[0].name).to eq("Ross")
    expect(game.players[1].name).to eq("Miles")
    expect(game.players[1].opponent_marker).to eq("V")
  end

  it "should get check to make sure a player's marker isn't being used" do
    allow(playersetup).to receive(:display_message_and_get_response).and_return("X","O")
    playersetup.get_marker(human, ["X"])
    expect(human.marker).to eq("O")
  end
end