require_relative 'spec_helper'

describe Turn do
  let(:turn) {Turn.new}
  let(:player) {Player.new}

  it "should created a new turn object with Turn.new" do
    expect(turn.class).to eq(Turn)
  end

  it "should prompt a player to make a move" do
    expect(STDOUT).to receive(:puts).with("It's your turn Player. Where would you like to move?")
    turn.prompt(player)
  end

end
