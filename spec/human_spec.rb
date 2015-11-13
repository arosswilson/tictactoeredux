require_relative 'spec_helper'
describe Human do
  let(:board) {Board.new({board_size: 3, board: [["_","X","O"],["O","X","_"],["_","O","X"]]})}
  let(:player) {Human.new(args={marker: 'X'})}

  it "should respond to name" do
    expect(player.name).to eq("Human")
  end

  it "should respond to marker" do
    expect(player.marker).to eq("X")
  end

  it "should respond to opponent marker" do
    expect(player.opponent_marker).to eq("O")
  end

  it "should get player info" do
    allow(player).to receive(:display_message_and_get_response).and_return("Ross",'V')
    player.get_info
    expect(player.name).to eq("Ross")
    expect(player.marker).to eq("V")
  end
end