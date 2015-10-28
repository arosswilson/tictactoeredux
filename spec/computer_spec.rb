require_relative 'spec_helper'
describe Computer do
  let(:board) {Board.new({board_size: 3, board: [["_","X","O"],["O","_","X"],["O","_","X"]]})}
  let(:board_two){Board.new({board_size: 3, board:[["_","X","_"],["O","X","_"],["O","_","X"]]})}
  let(:computer) {Computer.new({marker: "O", opponent_marker: "X"})}

  it "should responsd to marker" do
    expect(computer.marker).to eq("O")
  end

  it "should respond to opponent_marker" do
    expect(computer.opponent_marker).to eq("X")
  end

  it "should respond to name" do
    expect(computer.name).to eq("Computer")
  end

  it "should updated computer info" do
    allow(computer).to receive(:disp_and_res).and_return('V')
    computer.get_info("B")
    expect(computer.marker).to eq("V")
    expect(computer.opponent_marker).to eq("B")
  end

  describe "it should make the best move" do
    it "will win if it can" do
      computer.move(board)
      expect(board.board).to eq([["_","X","O"],["O","O","X"],["O","_","X"]])
    end

    it "will prevent the opponent from winning" do
      computer.move(board_two)
      expect(board_two.board).to eq([["O","X","_"],["O","X","_"],["O","_","X"]])
    end
  end
end