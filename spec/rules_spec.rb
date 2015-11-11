require_relative 'spec_helper'

describe Rules do
  let(:rules) {Rules.new}
  let(:board) {Board.new({board_size: 3, board: [["_","X","O"],["O","X","_"],["_","O","X"]]})}
  let(:winner) {Board.new({board_size: 3, board: [["X","_","O"],["O","X","_"],["_","O","X"]]})}

  it "should created a new rules object with Rules.new" do
    expect(rules.class).to eq(Rules)
  end

  describe "row checks" do
    it "should return nil on a row check if there isn't a winner" do
      expect(rules.row_check(board.board)).to eq(nil)
    end
  end
end