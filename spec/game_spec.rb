require_relative 'spec_helper'

describe Game do
  let(:game) {Game.new}

  it "should created a new rules object with Rules.new" do
    expect(game.class).to eq(Game)
  end

end