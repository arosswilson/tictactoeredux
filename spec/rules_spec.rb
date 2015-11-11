require_relative 'spec_helper'

describe Rules do
  let(:board) {Board.new({board_size: 3, board: [["_","X","O"],["O","X","_"],["_","O","X"]]})}
  let(:winner) {Board.new({board_size: 3, board: [["X","_","O"],["O","X","_"],["_","O","X"]]})}
  let(:row_winner) {Board.new({board_size: 3, board: [["X","X","X"],["O","O","_"],["_","O","X"]]})}
  let(:col_winner) {Board.new({board_size: 3, board: [["X","O","X"],["X","O","_"],["_","O","X"]]})}
  let(:tie) {Board.new({board_size: 3, board:[["X","O","X"],["X","O","O"], ["O","X","X"]]})}
  let(:rules_one) {Rules.new({board: board})}
  let(:rules_two) {Rules.new({board: row_winner})}
  let(:rules_three) {Rules.new({board: col_winner})}
  let(:rules_four) {Rules.new({board: winner})}
  let(:rules_five) {Rules.new({board: tie})}

  it "should created a new rules object with Rules.new" do
    expect(rules_one.class).to eq(Rules)
  end

  describe "row checks" do
    it "should return nil on a row check if there isn't a winner" do
      expect(rules_one.row_check).to eq(nil)
    end

    it "should return the winning piece if the board has a row winner" do
      expect(rules_two.row_check).to eq("X")
    end
  end

  describe "column checks" do
    it "should return nil on a column check if there isn't a winner" do
      expect(rules_one.col_check).to eq(nil)
    end

    it "should return the winning piece if the board has a col winner" do
      expect(rules_three.col_check).to eq("O")
    end
  end

  describe "diag checks" do
    it "should return nil on a diagonal check if there is no winner" do
      expect(rules_one.diag_check).to eq(nil)
    end

    it "should return the winning piece on a diagonal winner" do
      expect(rules_four.diag_check).to eq("X")
    end
  end

  describe "tie checks" do
    it "should return nil on a board that has blank spots" do
      expect(rules_one.tie_check).to eq(nil)
    end

    it "should return 'tie' on a board with no blank spaces" do
      expect(rules_five.tie_check).to eq("tie")
    end
  end
end