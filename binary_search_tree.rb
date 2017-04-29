class Node
  attr_reader :left_child, :right_child, :value

  def initialize(value)
  	@value = value
  	@left_child = nil
  	@right_child = nil
  end

  def build_tree(array)
    return if array.empty?

    left_side = []
    right_side = []

    array.each do |i|
      if i <= @value
      	left_side << i
      else
      	right_side << i
      end
    end
    
    if left_side.empty? == false
      @left_child = Node.new(left_side[0])
      left_side.shift
      @left_child.build_tree(left_side) 
    end
    
    if right_side.empty? == false
      @right_child = Node.new(right_side[0])
      right_side.shift
      @right_child.build_tree(right_side)
    end
    
  end

  def add_node(new_value)

  	if new_value <= @value
  	  if @left_child == nil
  	  	@left_child = Node.new(new_value) 
  	  else
  	    @left_child.add_node(new_value)
  	  end
  	else
  	  if @right_child == nil
        @right_child = Node.new(new_value)
      else
  	    @right_child.add_node(new_value)
  	  end
  	end
  end
end

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

def depth_first_search(root,target) 
  return nil if root.nil?
  #return root if root.value == target
  p root if root.value == target

  left = root.left_child
  right = root.right_child
  
  depth_first_search(left, target) unless left.nil?
  depth_first_search(right, target) unless right.nil?
end

#RANDOMIZED ARRAY
array = []
20.times do
  array << 1 +rand(20)
end

#array = [7,2,18,6,15,11,12,20,19,3,1,9,5,13,17,14,16,8,4,10]


root_node = Node.new(12)

root_node.build_tree(array)
root_node.add_node(7)

breadth_first_search(root_node,3)

p depth_first_search(root_node,3) #seems to print the nde when found, but won't return it
									#might be a recursion issue...

