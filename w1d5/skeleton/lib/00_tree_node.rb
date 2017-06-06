require 'byebug'

class PolyTreeNode
  def initialize(value)
    @value = value
    @children = []
    @parent = nil
  end

  def parent=(new_parent)
    @parent.children.delete(self) if @parent
    @parent = new_parent
    if @parent
      @parent.children << self
    end

  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise if child_node.parent == nil
    child_node.parent = nil
  end

  def parent
    @parent
  end

  def children
    @children
  end

  def value
    @value
  end

  def dfs(target)
    return self if self.value == target
    self.children.each do |child|
      result = child.dfs(target)
      return result if result
    end
    nil
  end

  def bfs(target)
    queue = [self]
    until queue.empty?
      check_node = queue.shift
      return check_node if check_node.value == target
      queue.concat check_node.children
    end
  end

end
