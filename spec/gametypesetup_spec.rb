require_relative 'spec_helper'

describe GametypeSetup do
  let(:game) {Game.new}
  let(:board) {Board.new({board_size: 3, board:[["X","O","X"],["X","O","O"], ["O","X","X"]] })}
  let(:finished_game){Game.new({board: board })}
  it "should welcome the players when it starts" do
    expect(STDOUT).to receive(:puts).with("Welcome to Tic-Tac-Toe!")
    GametypeSetup.welcome_message
  end

  it "should clear the screen" do
    expect(STDOUT).to receive(:puts).with("\e[H\e[2J")
    GametypeSetup.clear
  end

  it "should create players" do
    GametypeSetup.create_players("1", game)
    expect(game.players[0]).to be_a(Human)
    expect(game.players[1]).to be_a(Human)
  end

  it "should prompt user for game type" do
    allow(GametypeSetup).to receive(:gets).and_return("3")
    GametypeSetup.get_game_type(game)
    expect(game.players[0]).to be_a(Human)
    expect(game.players[1]).to be_a(Computer)
  end

  it "should create a new board based on user input" do
    allow(GametypeSetup).to receive(:gets).and_return("Y")
    GametypeSetup.play_again?(finished_game)
    expect(finished_game.board.board).to eq([["_","_","_"], ["_","_","_"], ["_","_","_"]])
    expect(finished_game.turn.users_move).to eq(nil)
  end
end