require_relative 'spec_helper'

describe PlayerSetup do
  let(:game) {Game.new}

  it "should change the order of the players based on user input" do
    allow(GametypeSetup).to receive(:gets).and_return("3")
    allow(PlayerSetup).to receive(:gets).and_return("2")
    GametypeSetup.get_game_type(game)
    PlayerSetup.choose_order(game)
    expect(game.players[0]).to be_a(Computer)
    expect(game.players[1]).to be_a(Human)
  end

  it "should get player info for each player" do
    allow(GametypeSetup).to receive(:display_message_and_get_response).and_return("1")
    GametypeSetup.get_game_type(game)
    allow(game.players[0]).to receive(:display_message_and_get_response).and_return("Ross","V")
    allow(game.players[1]).to receive(:display_message_and_get_response).and_return("Miles","O")
    PlayerSetup.update_player_info(game)
    expect(game.players[0]).to be_a(Human)
    expect(game.players[1]).to be_a(Human)
    expect(game.players[0].name).to eq("Ross")
    expect(game.players[1].name).to eq("Miles")
  end
end