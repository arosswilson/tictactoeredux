require_relative '../lib/board'
require_relative '../lib/computer'
require_relative '../lib/human'
describe Board do
  let(:winner) {Board.new({board_size: 3, board: [["X","_","O"],["O","X","_"],["_","O","X"]]})}
  let(:test_board) {Board.new}
  let(:player) {Human.new({marker: "X", name: "Ross"})}
  let(:computer) {Computer.new({marker: "O"})}
  let(:board) {Board.new({board_size: 3, board: [["_","X","O"],["O","X","_"],["_","O","X"]]})}

  it "updates the board with the move method" do
    test_board.move("X","1,1")
    expect(test_board.board[1][1]).to eq("X")
  end

  describe "finds possible moves" do
    it "shows possible moves on game in progress" do
      expect(board.possible_moves).to eq(["0,0", "1,2", "2,0"])
    end

    it "shows possible moves on starting game" do
      expect(test_board.possible_moves).to eq(["0,0", "0,1", "0,2", "1,0", "1,1", "1,2", "2,0", "2,1", "2,2"])
    end
  end

  it "undoes a move" do
    board.undo('0,1')
    expect(board.board).to eq([["_","_","O"],["O","X","_"],["_","O","X"]])
  end
end