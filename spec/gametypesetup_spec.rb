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
    players = setup.create_players("1")
    expect(players[0]).to be_a(Human)
    expect(players[1]).to be_a(Human)
  end

  it "should prompt user for game type" do
    allow(setup).to receive(:gets).and_return("3")
    players = setup.get_game_type
    expect(players[0]).to be_a(Human)
    expect(players[1]).to be_a(Computer)
  end
end