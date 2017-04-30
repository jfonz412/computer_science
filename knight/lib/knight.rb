# I commented the hell out of this problem because I had some trouble with it
# and felt like a summary would sort of solidify things for myself. Enjoy!

require './lib/moves.rb'

=begin
	'Node' contains an x and y variable, which will act not only 
	as it's coordinates on the chess boardbut also the index values 
	for the 'board' array that holds each of the 64 nodes, or "squares"
=end
class Node
  include MovesetMaker 
  attr_reader :moves
  attr_accessor :parent

  def initialize(x,y)
  	@x = x
  	@y = y
  	@parent = nil 
  	@moves = create_moveset
  end
end

=begin
	This function creates a 64-element array. Each index contains a node who's
	coordinates (x and y variables) are set alongside it's index value in the 
	board array. For example, board[3][4] contains a node who's x and y values 
	are '3' and '4'respectivly.
=end
def create_board
  board = []

  for x in 0..7
    board[x] = []
    for y in 0..7
  	  board[x] << Node.new(x,y)
    end
  end
  board
end

=begin
	Knight's moves expects two x and y coordinates (passed as arrays) as it's
	arguments. First we create a board, then a queue and a path to track our steps 
	(retrospectivly, as we'll see).

	We begin our "BFS" by working from queue[0], which we passed our starting 
	coordinates to. Use the board to find the node at those coordinates, which 
	we set to "current_node". We then want to add all potential moves from this
	square to our queue, UNLESS it's the square we started with OR it has already 
	been assigned a parent.

	Each node initializes with it's parent set to nil. When it is called in this function, 
	it's parent is set to the coordinates of 'current_node', which is 'queue[0]. 
	In this way, after we finally reach our target square, we can "walk" backwards through 
	each parent node to trace the actual path our search function took. 

	If a node already has a parent, it means it has already been added to our que by another
	node at some point, and we do not want to check the same node over and over (potentially
	creating an infinite loop).

	Once the queue has been added to, we check for the finish coordinates. If they are
	not present, queue[0] is removed from the array, and the next element in the queue
	becomes the 'current_node'.

	Finally, when we finally find the finish coordinates, we loop through, adding each 
	'parent' to our path array where appropriate. We then break the main loop, and return
	path after outputting our number of steps.

=end
def knights_moves(start, finish)
  board = create_board

  path = []
  queue = []

  queue << start

  loop do
  	current_node = board[queue[0][0]][queue[0][1]]

    current_node.moves.each do |node|
      unless node == start || board[node[0]][node[1]].parent != nil
        board[node[0]][node[1]].parent = queue[0] 
        queue << node
      end	
    end

    if queue.include? finish

      parent = board[finish[0]][finish[1]].parent
      path << parent

      loop do
      	parent = board[parent[0]][parent[1]].parent
      	break if parent == nil
      	path.unshift(parent)
      end

      path << finish
      break
    end

  	queue.shift
  end
  puts "You can make it in #{path.length-1} steps!"
  path
end

p knights_moves([0,0],[1,2]) #one move
puts
p knights_moves([1,3],[4,4]) #2?? moves
puts
p knights_moves([0,0],[7,7])  #across the board