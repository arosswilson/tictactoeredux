module View
  def display(message)
    puts message
  end

  def get_response
    gets.chomp
  end

  def disp_and_res(message)
    display(message)
    return get_response
  end

  def welcome
    puts "Welcome to Tic Tac Toe!"
  end

  def clear
    puts "\e[H\e[2J"
  end

  def show_board(board)
    puts board.to_s
  end
end
