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

end