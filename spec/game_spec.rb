require_relative 'spec_helper'

describe Game do
  let(:game) {Game.new}

  it "should created a new rules object with Rules.new" do
    expect(game.class).to eq(Game)
  end

  it "should initialize with a board" do
    expect(game.board.class).to eq(Board)
  end

  it "should initiaize with rule" do
    expect(game.rules.class).to eq(Rules)
  end

  it "should welcome the players when it starts" do
    expect(STDOUT).to receive(:puts).with("Welcome to Tic-Tac-Toe!")
    game.welcome_message
  end

  it "should clear the screen" do
    expect(STDOUT).to receive(:puts).with("\e[H\e[2J")
    game.clear
  end

  it "should create players" do
    game.create_players("1")
    expect(game.players[0]).to be_a(Human)
    expect(game.players[1]).to be_a(Human)
  end

  it "should prompt user for game type" do
    allow(game).to receive(:gets).and_return("3")
    game.get_game_type
    expect(game.players[0]).to be_a(Human)
    expect(game.players[1]).to be_a(Computer)
  end

end