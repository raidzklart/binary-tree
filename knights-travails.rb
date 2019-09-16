class Node
  attr_accessor :x, :y, :children, :parent
  def initialize(x_position, y_position)
    @x = x_position
    @y = y_position
    @parent = nil
    @children = []
  end

  def to_s
    "X:#{@x}, Y:#{@y}"
  end
end

class Board
  attr_accessor :cells
  def initialize
    @cells = []
    (1..8).each { |x| (1..8).each { |y| @cells << Node.new(x,y)}}
  end
end

class Knight
  attr_accessor :possible_moves, :board_cells
  def initialize
    @board_cells = Board.new.cells
  end
end

knight = Knight.new