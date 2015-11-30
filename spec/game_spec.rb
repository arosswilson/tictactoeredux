require_relative 'spec_helper'

describe Game do
  let(:board) {Board.new({board_size: 3, board:[["X","O","X"],["X","O","O"], ["O","X","X"]] })}
  let(:game){Game.new({board: board })}

  it "should created a new rules object with Rules.new" do
    expect(game.class).to eq(Game)
  end

  it "should initialize with a board" do
    expect(game.board.class).to eq(Board)
  end

  it "should initiaize with rule" do
    expect(game.rules.class).to eq(Rules)
  end

  it "should create a new board based on user input" do
    allow(game).to receive(:gets).and_return("Y")
    game.play_again?
    expect(game.board.board).to eq([["_","_","_"], ["_","_","_"], ["_","_","_"]])
    expect(game.turn.users_move).to eq(nil)
  end
end