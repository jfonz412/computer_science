# REFACTORED UNTIL ===

class Node
  attr_reader :left_child, :right_child, :value

  def initialize(value = nil)
  	@value = value
  	@left_child = nil
  	@right_child = nil
  end

  def add_node(value)
    if @value.nil?
      @value = value
    elsif value <= @value
      @left_child.add_node(value) if @left_child != nil
      @left_child = Node.new(value) if @left_child == nil
    else
      @right_child.add_node(value) if @right_child != nil
      @right_child = Node.new(value) if @right_child == nil
    end
  end

end

def build_tree(array)
  root_node = Node.new
  array.each {|i| root_node.add_node(i)}
  return root_node
end

def print_tree(root)
  puts "Value: #{root.value}"
  puts "Left Child: #{root.left_child.value}"
  puts "Right Child #{root.right_child.value}"
end

#======================================================


def breadth_first_search(root,target)
  queue = [] #FIFO
  queue << root.left_child
  queue << root.right_child

  while queue.empty? == false
    current = queue.shift
    if current.value == target
      return current
    else
      queue << current.left_child if current.left_child != nil
      queue << current.right_child if current.right_child != nil
    end
  end
end

#NO IDEA WHY THIS DOESN'T WORK. IT PRINTS THE CORRECT NODE BUT ONLY RETURNS NIL
def depth_first_search(node,target) 
  return nil if node.nil?
  p node if node.value == target

  left = node.left_child
  right = node.right_child
  
  left_results = depth_first_search(left, target) unless left.nil?
  right_results = depth_first_search(right, target) unless right.nil?
end

#RANDOMIZED ARRAY
=begin
array = []
20.times do
  array << 1 +rand(20)
end
=end

array = [7,2,18,6,15,11,12,20,19,3,1,9,5,13,17,14,16,8,4,10]

root = build_tree(array)
print_tree(root)
p depth_first_search(root, 3)
p breadth_first_search(root,3)

