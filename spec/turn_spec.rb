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
    expect(STDOUT).to receive(:puts).with("1,1")
    turn.show_available_moves(["1,1"])
  end

  it "should ensure that the user's move is valid" do
    allow(turn).to receive(:gets).and_return("1,1")
    turn.get_users_move
    expect(turn.users_move).to eq("1,1")
  end

end
