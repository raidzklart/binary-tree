class Cell
  attr_accessor :x_pos, :y_pos, :children, :parent
  def initialize(x_position, y_position)
    @x_pos = x_position
    @y_pos = y_position
    @parent = nil
    @children = []
  end
  def to_s
    [@x_pos, @y_pos].to_s
  end
end

class Board
  attr_accessor :cells
  def initialize
    @cells = []
    (1..8).reverse_each { |x| (1..8).each { |y| @cells << Cell.new(x,y)}}
  end

  def to_s
    counter = 0
    rows = ""
    @cells.each_with_index do |cell, i|
      rows +=  "#{i}: #{cell}"
      counter += 1
      if counter == 8
        rows << "\n\n"
        counter = 0
      end
    end
    rows
  end
end

class Knight
  attr_accessor :moves, :board_cells
  KNIGHT_MOVES = [[-2, -1], [-2, 1], [-1, -2], [-1, 2], [1, -2], [1, 2], [2, -1], [2, 1]]
  def initialize(board)
    @board = board
    @moves = []
    possible_moves(@board.cells[35])
  end

  def possible_moves(start_cell)
    @board.cells.each do |cell|
      KNIGHT_MOVES.each do |move|
        if cell.x_pos == start_cell.x_pos + move[0]
          if cell.y_pos == start_cell.y_pos + move[1]
            @moves << cell
          end
        end
      end
    end
  end
end

board = Board.new
knight = Knight.new(board)
puts knight.moves