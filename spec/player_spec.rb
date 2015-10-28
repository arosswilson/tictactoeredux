require_relative 'spec_helper'
describe Player do
  let(:board) {Board.new({board_size: 3, board: [["_","X","O"],["O","X","_"],["_","O","X"]]})}
  let(:player) {Player.new(args={marker: 'X'})}

  it "should respond to name" do
    expect(player.name).to eq("Player")
  end

  it "should respond to marker" do
    expect(player.marker).to eq("X")
  end

  it "should respond to opponent marker" do
    expect(player.opponent_marker).to eq("O")
  end

  it "should get player info" do
    allow(player).to receive(:disp_and_res).and_return("Ross",'V')
    player.get_info
    expect(player.name).to eq("Ross")
    expect(player.marker).to eq("V")
  end

  it "should make a move on a board" do
    allow(player).to receive(:disp_and_res).and_return("1,2")
    player.move(board)
    expect(board.board).to eq([["_","X","O"],["O","X","X"],["_","O","X"]])
  end
end