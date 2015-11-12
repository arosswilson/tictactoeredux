require_relative 'spec_helper'

describe GametypeSetup do
  let(:setup) {GametypeSetup.new}
  let(:game) {Game.new}
  it "should welcome the players when it starts" do
    expect(STDOUT).to receive(:puts).with("Welcome to Tic-Tac-Toe!")
    GametypeSetup.welcome_message
  end

  it "should clear the screen" do
    expect(STDOUT).to receive(:puts).with("\e[H\e[2J")
    GametypeSetup.clear
  end

  it "should create players" do
    GametypeSetup.create_players("1", game)
    expect(game.players[0]).to be_a(Human)
    expect(game.players[1]).to be_a(Human)
  end

  it "should prompt user for game type" do
    allow(GametypeSetup).to receive(:gets).and_return("3")
    GametypeSetup.get_game_type(game)
    expect(game.players[0]).to be_a(Human)
    expect(game.players[1]).to be_a(Computer)
  end

  it "should change the order of the players based on user input" do
    allow(GametypeSetup).to receive(:gets).and_return("3","2")
    GametypeSetup.get_game_type(game)
    GametypeSetup.choose_order(game)
    expect(game.players[0]).to be_a(Computer)
    expect(game.players[1]).to be_a(Human)
  end

  it "should get player info for each player" do
    allow(GametypeSetup).to receive(:display_message_and_get_response).and_return("1")
    GametypeSetup.get_game_type(game)
    allow(game.players[0]).to receive(:disp_and_res).and_return("Ross","V")
    allow(game.players[1]).to receive(:disp_and_res).and_return("Miles","O")
    GametypeSetup.update_player_info(game)
    expect(game.players[0]).to be_a(Human)
    expect(game.players[1]).to be_a(Human)
    expect(game.players[0].name).to eq("Ross")
    expect(game.players[1].name).to eq("Miles")
  end

  # it "should setup the game" do
  #   allow(GametypeSetup).to receive(:display_message_and_get_response).and_return("1")
  #   allow(game.players[0]).to receive(:disp_and_res).and_return("Ross","V")
  #   allow(game.players[1]).to receive(:disp_and_res).and_return("Miles","O")
  #   allow(GametypeSetup).to receive(:gets).and_return("2")
  #   GametypeSetup.run(game)
  #   allow(game.players[0]).to receive(:disp_and_res).and_return("Ross","V")
  #   allow(game.players[1]).to receive(:disp_and_res).and_return("Miles","O")
  #   expect(game.players[0]).to be_a(Human)
  #   expect(game.players[1]).to be_a(Human)
  #   expect(game.players[0].name).to eq("Ross")
  #   expect(game.players[1].name).to eq("Miles")
  # end
end