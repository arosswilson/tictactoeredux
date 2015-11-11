require_relative 'view'
require_relative 'human'
require_relative 'board'
require_relative 'computer'
require_relative 'controller'

controller = Controller.new({board: Board.new({board_size: 3})})
controller.run