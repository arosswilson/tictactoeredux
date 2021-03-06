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

  describe "it should make the best move" do
    it "will win if it can" do
      computer.move(board)
      expect(computer.last_move).to eq("1,1")
    end

    it "will prevent the opponent from winning" do
      computer.move(board_two)
      expect(computer.last_move).to eq("0,0")
    end
  end
end