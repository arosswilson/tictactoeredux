require_relative 'spec_helper'

describe Rules do
  let(:board) {Board.new({board_size: 3, board: [["_","X","O"],["O","X","_"],["_","O","X"]]})}
  let(:winner) {Board.new({board_size: 3, board: [["X","_","O"],["O","X","_"],["_","O","X"]]})}
  let(:row_winner) {Board.new({board_size: 3, board: [["X","X","X"],["O","O","_"],["_","O","X"]]})}
  let(:col_winner) {Board.new({board_size: 3, board: [["X","O","X"],["X","O","_"],["_","O","X"]]})}
  let(:rules_one) {Rules.new({board: board})}
  let(:rules_two) {Rules.new({board: row_winner})}
  let(:rules_three) {Rules.new({board: col_winner})}

  it "should created a new rules object with Rules.new" do
    expect(rules.class).to eq(Rules)
  end

  describe "row checks" do
    it "should return nil on a row check if there isn't a winner" do
      expect(rules.row_check).to eq(nil)
    end

    it "should return the winning piece if the board has a row winner" do
      expect(rules_two.row_check).to eq("X")
    end
  end

  describe "column checks" do
    it "should return nil on a column check if there isn't a winner" do
      expect(rules_three.col_check).to eq(nil)
    end
  end
end