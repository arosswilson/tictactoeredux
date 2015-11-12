require_relative 'spec_helper'

describe GametypeSetup do
  let(:setup) {GametypeSetup.new}
  let(:game) {Game.new}
  it "should welcome the players when it starts" do
    expect(STDOUT).to receive(:puts).with("Welcome to Tic-Tac-Toe!")
    setup.welcome_message
  end

  it "should clear the screen" do
    expect(STDOUT).to receive(:puts).with("\e[H\e[2J")
    setup.clear
  end

  it "should create players" do
    setup.create_players("1", game)
    expect(game.players[0]).to be_a(Human)
    expect(game.players[1]).to be_a(Human)
  end

  it "should prompt user for game type" do
    allow(setup).to receive(:gets).and_return("3")
    setup.get_game_type(game)
    expect(game.players[0]).to be_a(Human)
    expect(game.players[1]).to be_a(Computer)
  end

  it "should change the order of the players based on user input" do
    allow(setup).to receive(:gets).and_return("3","2")
    setup.get_game_type(game)
    setup.choose_order(game)
    expect(game.players[0]).to be_a(Computer)
    expect(game.players[1]).to be_a(Human)
  end

  it "should get player info for each player" do
    allow(setup).to receive(:display_message_and_get_response).and_return("1")
    setup.get_game_type(game)
    allow(game.players[0]).to receive(:disp_and_res).and_return("Ross","V")
    allow(game.players[1]).to receive(:disp_and_res).and_return("Miles","O")
    setup.update_player_info(game)
    expect(game.players[0]).to be_a(Human)
    expect(game.players[1]).to be_a(Human)
    expect(game.players[0].name).to eq("Ross")
    expect(game.players[1].name).to eq("Miles")
  end
end