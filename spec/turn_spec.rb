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

  describe "the Verification method" do
    it "should return true if the move is in the available moves array" do
      allow(turn).to receive(:gets).and_return("1,1")
      turn.get_users_move
      expect(turn.verify_move_is_available(["1,1", "2,2"])).to be_truthy
    end

    it "should return false if the move is not in the available moves array" do
      allow(turn).to receive(:gets).and_return("2,1")
      turn.get_users_move
      expect(turn.verify_move_is_available(["1,1", "2,2"])).to be_falsey
    end
  end

  it "should continue to prompt a user for a move until it gets one in the available moves array" do
    allow(turn).to receive(:gets).and_return("2,1", "1,1")
    turn.take_turn(["1,1", "2,2"])
    expect(turn).to receive(:gets).exactly(2).times
    expect(turn.users_move).to eq("1,1")
  end


end
