require_relative 'spec_helper'
class Dummyclass
  include View
  def type
    puts "dummy class"
  end
end
describe View do
  let(:board) {Board.new}
  let(:dummy) { Dummyclass.new }

  it"should display a message" do
    expect(STDOUT).to receive(:puts).with("test phrase")
    dummy.display("test phrase")
  end

  it "should get input" do
    allow(dummy).to receive(:gets).and_return("user input")
    expect(dummy.get_response).to eq("user input")
  end

  it "should show welcome message" do
    expect(STDOUT).to receive(:puts).with("Welcome to Tic Tac Toe!")
    dummy.welcome
  end

  it "should clear the screen" do
    expect(STDOUT).to receive(:puts).with("\e[H\e[2J")
    dummy.clear
  end

  it "should display the board" do
    expect(STDOUT).to receive(:puts).with(" 0 1 2\n0_|_|_\n1_|_|_\n2_|_|_\n")
    dummy.show_board(board)
  end
end