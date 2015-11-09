require_relative 'spec_helper'

describe Turn do

  it "should created a new turn object with Turn.new" do
    turn = Turn.new
    expect(turn.class).to eq(Turn)
  end

end
