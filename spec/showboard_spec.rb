require_relative 'spec_helper'

describe ShowBoard do
  let(:showboard) {ShowBoard.new}
  it "should be ShowBoard class" do
    expect(showboard.class).to eq(ShowBoard)
  end
end