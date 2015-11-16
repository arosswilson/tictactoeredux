require_relative 'spec_helper'

describe ShowBoard do
  let(:showboard) {ShowBoard.new}
  let(:board) {Board.new({board_size: 3, board: [["_","X","O"],["O","X","_"],["_","O","X"]]})}
  it "should be ShowBoard class" do
    expect(showboard.class).to eq(ShowBoard)
  end

  it "should stringify the board" do
    expect(STDOUT).to receive(:puts).with("\e[H\e[2J")
    expect(STDOUT).to receive(:puts).with(" 0 1 2\n0_|X|O\n1O|X|_\n2_|O|X\n")
    ShowBoard.run(board)
  end
end