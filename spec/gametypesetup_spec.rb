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
end