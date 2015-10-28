require_relative 'spec_helper'
describe Controller do
  let(:board) {Board.new({board_size: 3})}
  let(:controller) {Controller.new(board: board)}
  let(:player) {Player.new(marker: 'X')}
  let(:computer) {Computer.new(marker: 'O', opponent_marker: 'X')}
  let(:controller_two){Controller.new(board: board, players:[player, computer])}
  let(:win_board){Board.new({board_size: 3, board:[["_","X","O"],["O","O","X"],["O","_","X"]]})}
  let(:controller_three){Controller.new(board: win_board, players:[player, computer])}
  let(:tie_board){Board.new({board_size: 3, board:[["O","X","O"],["O","X","X"],["X","O","X"]]})}
  let(:controller_four){Controller.new(board: tie_board, players:[player, computer])}

  describe "it should create players based on game type selected" do
    it "should create two players if user chooses human v human" do
      allow(controller).to receive(:disp_and_res).and_return("1")
      controller.send :get_game_type
      expect(controller.players[0].class).to eq(Player)
      expect(controller.players[1].class).to eq(Player)
    end

    it "should create two computers if user chooses computer v computer" do
      allow(controller).to receive(:disp_and_res).and_return("2")
      controller.send :get_game_type
      expect(controller.players[0].class).to eq(Computer)
      expect(controller.players[1].class).to eq(Computer)
    end

    it "should create a player and computer if user chooses player v computer" do
      allow(controller).to receive(:disp_and_res).and_return("3")
      controller.send :get_game_type
      expect(controller.players[0].class).to eq(Player)
      expect(controller.players[1].class).to eq(Computer)
    end
  end

  it "should change the order of the players if user wants to" do
    allow(controller).to receive(:disp_and_res).and_return("3", "2")
    controller.send :get_game_type
    controller.send :choose_order
    expect(controller.players[0].class).to eq(Computer)
    expect(controller.players[1].class).to eq(Player)
  end

  it "should make a move for a player" do
    allow(player).to receive(:disp_and_res).and_return("1,1")
    controller_two.send :move, controller_two.players[0]
    expect(controller.board.board).to eq([["_","_","_"],["_","X","_"],["_","_","_"]])
  end

  describe "it should find the winner" do
    it "should report the winner on a won board" do
      expect(controller_three.send :find_winner).to eq("Winner: Computer Computer")
    end

    it "should report a tie when it's a tie" do
      expect(controller_four.send :find_winner).to eq("tie")
    end
  end
end

