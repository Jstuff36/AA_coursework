require_relative '00_tree_node'
require 'byebug'

class KnightPathFinder

  DELTAS = [
    [2,1],
    [1,2],
    [-2,1],
    [-1,2],
    [2,-1],
    [1,-2],
    [-2,-1],
    [-1,-2]
  ]

  def self.valid_moves(pos)
    return false if pos[0] < 0 || pos[1] < 0
    return false if pos[0] > 7 || pos[1] > 7
    true
  end

  attr_reader :move_tree

  def initialize(pos)
    @root = PolyTreeNode.new(pos)
    @path = []
  end

  def find_childless(node = @root)
    if node.children.length == 0
      create_children(node)
      return
    else
      node.children.map do |child|
        find_childless(child)
      end
    end
  end

  def find_path(end_pos)
    node = @root.bfs(end_pos)
    until node
      find_childless
      node = @root.bfs(end_pos)
    end
    trace_path_back(node)
  end

  def trace_path_back(node)
    until node == @root
      @path.unshift(node.value)
      node = node.parent
    end
    @path.unshift(@root.value)
  end

  def create_children(node)
    curr_pos = node.value
    DELTAS.each do |move|
      new_pos = [curr_pos[0] + move[0], curr_pos[1] + move[1]]
      if KnightPathFinder.valid_moves(new_pos)
        new_tree = PolyTreeNode.new(new_pos)
        node.add_child(new_tree)
      end
    end
  end

end


kpf = KnightPathFinder.new([0,0])
p kpf.find_path([6, 2])
