module MovesetMaker

  def create_moveset
    moves = [
		      [@x - 1, @y + 2], 
		      [@x + 1, @y + 2],
		      [@x + 2, @y + 1],
		      [@x + 2, @y - 1],
		      [@x + 1, @y - 2],
		      [@x - 1, @y - 2],
		      [@x - 2, @y - 1],
		      [@x - 2, @y + 1]
		   ]

    # Remove illegal moves
    moves.delete_if {|x_y| true if x_y[0] < 0 || x_y[1] < 0}
    moves.delete_if {|x_y| true if x_y[0] > 7 || x_y[1] > 7}
  end

end