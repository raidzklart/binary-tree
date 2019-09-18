class Cell
  attr_accessor :coords, :children, :parent
  def initialize(coords, parent = nil)
    @coords = coords
    @parent = parent
    @children = []
  end
end

class Knight
  attr_reader :board
  attr_accessor :path
  MOVES = [[-2,-1], [-2,1], [-1,-2], [-1,2], [1,-2], [1,2], [2,-1], [2,1]]
  def initialize
    @board = create_board
    @path = []
  end

  def build_children(root)
		possible_moves = MOVES.select { |move| check_move(move, root.coords) }
		root.children = possible_moves.map { |move| Cell.new([(move[0]+root.coords[0]), (move[1]+root.coords[1])], root) }
  end
  
  def completion(move)
		puts "You reached your spot in #{pathway(move).size} moves! Here is your path:"
		path.reverse.each { |move| p move }
		p move.coords
  end
  
  def knight_moves(root, goal)
    return puts "You are already there!" if root == goal
    return puts "Invalid!" unless root[0].between?(0,7) && root[1].between?(0,7) && goal[0].between?(0,7) && goal[1].between?(0,7)
    queue = self.build_children(Cell.new(root))
    while true
      node = queue.shift
      return self.completion(node) if node.coords == goal
      queue += self.build_children(node)
    end
  end

  private
  def create_board
    board = Array.new(8) { Array.new(8) { Array.new(2) } }
	  board.each_with_index do |row, row_i|
			row.each_with_index { |column, column_i| column[0], column[1] = row_i, column_i }
		end
  end

  def check_move(move, current)
		result = [(move[0] + current[0]), (move[1] + current[1])]
		result[0].between?(0,7) && result[1].between?(0,7) ? true : false
	end

	def pathway(node)
		until node.parent.nil?
			@path << node.parent.coords
			node = node.parent
		end
		path
  end
end

knight = Knight.new
knight.knight_moves([1,1], [3,1])
knight.knight_moves([0,1], [0,1])
knight.knight_moves([8,9], [1,2])
knight.knight_moves([0,0], [3,4])