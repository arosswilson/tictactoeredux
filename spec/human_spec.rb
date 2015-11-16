require_relative 'spec_helper'
describe Human do
  let(:board) {Board.new({board_size: 3, board: [["_","X","O"],["O","X","_"],["_","O","X"]]})}
  let(:player) {Human.new(args={marker: 'X'})}

  it "should respond to name" do
    expect(player.name).to eq("Human")
  end

  it "should respond to marker" do
    expect(player.marker).to eq("X")
  end
end