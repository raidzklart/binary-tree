class Node
  attr_reader :left_child, :right_child, :value
  attr_accessor :parent
  def initialize(value=nil)
    @value = value
    @parent= nil
    @left_child = nil
    @right_child = nil
  end

  def child=(node)
    if node.value < @value
      @left_child = node
    elsif node.value > @value
      @right_child =node
    else
      return nil
    end
    self
  end
end

class BinaryTree
  attr_accessor :root
  def initialize(array)
    @root = Node.new(array.shift)
    build_tree(array)
  end

  def build_tree(array)
    array.each { |value| add_node(@root,Node.new(value)) }
  end

  def add_node(parent, node)
    if node.value < root.value
      if parent.left_child.nil?
        parent.child = node
        node.parent = parent
      else
        add_node(parent.left_child, node)
      end
    elsif node.value > root.value
      if parent.right_child.nil?
        parent.child = node
        node.parent = parent
      else
        add_node(parent.right_child, node)
      end
    end
  end
end

tree = BinaryTree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
p tree