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

  it "should take an array of available moves and display them to the user" do
    expect(STDOUT).to receive(:puts).with("1,1\n1,2\n2,0\n")
    turn.show_available_moves(["1,1","1,2","2,0"])
  end

end
