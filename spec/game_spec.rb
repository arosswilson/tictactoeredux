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

end