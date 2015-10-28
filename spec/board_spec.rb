require_relative '../lib/board'
require_relative '../lib/computer'
require_relative '../lib/player'
describe Board do
  let(:winner) {Board.new({board_size: 3, board: [["X","_","O"],["O","X","_"],["_","O","X"]]})}
  let(:test_board) {Board.new}
  let(:player) {Player.new({marker: "X", name: "Ross"})}
  let(:computer) {Computer.new({marker: "O"})}
  let(:board) {Board.new({board_size: 3, board: [["_","X","O"],["O","X","_"],["_","O","X"]]})}

  it "updates the board with the move method" do
    test_board.move("X","1,1")
    expect(test_board.board[1][1]).to eq("X")
  end

  describe "finds winning boards" do
    it "finds winning boards" do
      expect(winner.game_over?).to be_truthy
    end

    it "it knows when a board isn't a winner" do
      expect(board.game_over?).to be_falsey
    end
  end

  describe "finds possible moves" do
    it "shows possible moves on game in progress" do
      expect(board.possible_moves).to eq(["0,0", "1,2", "2,0"])
    end

    it "shows possible moves on starting game" do
      expect(test_board.possible_moves).to eq(["0,0", "0,1", "0,2", "1,0", "1,1", "1,2", "2,0", "2,1", "2,2"])
    end
  end

  it "creates a new board" do
    expect(Board.newboard(winner).board).to eq([["_","_","_"],["_","_","_"],["_","_","_"]])
  end

  it "undoes a move" do
    board.undo('0,1')
    expect(board.board).to eq([["_","_","O"],["O","X","_"],["_","O","X"]])
  end

  describe "the move validator" do
    it "returns true if the move is a possible move" do
      expect(board.validate_move('1,2')).to be_truthy
    end

    it "returns false if the move isn't a possible move" do
      expect(board.validate_move('1,1')).to be_falsey
    end
  end

  it "should stringify the board" do
    expect(board.to_s).to eq(" 0 1 2\n0_|X|O\n1O|X|_\n2_|O|X\n")
  end
end