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
    expect(STDOUT).to receive(:puts).with("2,2")
    turn.show_available_moves(["1,1", "2,2"])
  end

  it "should get input from a user and set users_move" do
    allow(turn).to receive(:gets).and_return("1,1")
    turn.get_users_move
    expect(turn.users_move).to eq("1,1")
  end

  it "should validate that the user's selection is in the array of available moves" do
    allow(turn).to receive(:gets).and_return("1,1")
    turn.get_users_move
    expect(turn.verify_move_is_available(["1,1", "2,2"])).to be_truthy
  end

end
