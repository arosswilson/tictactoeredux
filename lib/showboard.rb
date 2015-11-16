class ShowBoard
  def self.run(board)
    clear
    puts stringify(board)
  end

  private

  def self.stringify(board)
    top_row = create_the_top_display_row(board)
    display = add_additional_board_rows(top_row, board)
    return display
  end

  def self.create_the_top_display_row(board)
    " " +('0'...(board.board_size.to_s)).to_a.join(' ') + "\n"
  end

  def self.add_additional_board_rows(top_row, board)
    board.board.each.with_index do |row, i|
      top_row += (i.to_s + row.join("|")+ "\n")
    end
    top_row
  end

  def self.clear
    puts "\e[H\e[2J"
  end
end