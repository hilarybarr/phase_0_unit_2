# U2.W6: Create a BoggleBoard Class


# I worked on this challenge [ with: Alan Florendo ].


# 2. Pseudocode



=begin
# 3. Initial Solution: returns row and col as arrays


class Boggle_Board
    def initialize(board)    
            raise ArgumentError.new("Board cannot be empty") if board.empty?
            @board = board
    end

# Part 1: Access multiple elements of a nested array
  def create_word(*coords)
    coords.map { |coord| @board[coord.first][coord.last]}.join("")
  end

  # Part 2: Write a method that takes a row number and returns all the elements in the row.  
  def get_row(row)
    @board[row-1]
  end

  

  # Part 3: Now write a method that takes a column number and returns all the elements in the column.
  def get_col(col)
    boardtransposed = @board.transpose
    boardtransposed[col-1]
  end


end
  


#Driver Test Code

# p boggle_board2=Boggle_Board.new([]) # Should return argument error

dice_grid = [["b", "r", "a", "e"],
             ["i", "o", "d", "t"],
             ["e", "c", "l", "r"],
             ["t", "a", "k", "e"]]
 
boggle_board1 = Boggle_Board.new(dice_grid)
 



def assert
  raise "Assertion failed!" unless yield
end

# Driver code for create_word method
assert {boggle_board1.create_word([2,1],[1,1],[1,2],[0,3]) == "code"} 
assert {boggle_board1.create_word([1,2], [1,1], [2,1], [3,2]) == "dock"}
assert {boggle_board1.create_word([0,1],[0,2],[1,2]) == "rad"}  


#Driver code for get_row method
assert {boggle_board1.get_row(1) ==  ["b", "r", "a", "e"]}
assert {boggle_board1.get_row(2) ==  ["i", "o", "d", "t"]}
assert {boggle_board1.get_row(3) ==  ["e", "c", "l", "r"]}
assert {boggle_board1.get_row(4) ==  ["t", "a", "k", "e"]}


 #Driver code for get_col method
 assert {boggle_board1.get_col(1) ==  ["b", "i", "e", "t"]}
 assert {boggle_board1.get_col(2) ==  ["r", "o", "c", "a"]}
 assert {boggle_board1.get_col(3) ==  ["a", "d", "l", "k"]}
 assert {boggle_board1.get_col(4) ==  ["e", "t", "r", "e"]}

=end










# 4. Refactored Solution: returns row and col as strings




class Boggle_Board

	require 'Matrix'

    def initialize(board)    
            raise ArgumentError.new("Board cannot be empty") if board.empty?
            @board = board
    end

# Part 1: Access multiple elements of a nested array
  def create_word(*coords)
    coords.map { |coord| @board[coord.first][coord.last]}.join("")
  end

  # Part 2: Write a method that takes a row number and returns all the elements in the row.  
  def get_row(row)
    @board[row-1].join("")
  end

  

  # Part 3: Now write a method that takes a column number and returns all the elements in the column.
  def get_col(col)
    boardtransposed = @board.transpose
    boardtransposed[col-1].join("")
  end

  # Create a get_diagonal method
  def get_diagonal(*coords)
  	puts (coords.first..coords.last).collect{|i|@board[i][i]}

  end
end
  





#Driver Test Code

# p boggle_board2=Boggle_Board.new([]) # Should return argument error

dice_grid = [["b", "r", "a", "e"],
             ["i", "o", "d", "t"],
             ["e", "c", "l", "r"],
             ["t", "a", "k", "e"]]
 
boggle_board1 = Boggle_Board.new(dice_grid)
 

# p boggle_board1.get_diagonal([0,1], [1,1], [2,2], [3,3])

boggle_board1.get_diagonal([0,1], [1,1])



def assert
  raise "Assertion failed!" unless yield
end


# Driver test code for accessing individual coordinate
# Note I could have created a separate method for this but it wasn't necessary since this method does this easily
assert {boggle_board1.create_word([3,2])=="k"}

# Driver code for create_word method
assert {boggle_board1.create_word([2,1],[1,1],[1,2],[0,3]) == "code"} 
assert {boggle_board1.create_word([1,2], [1,1], [2,1], [3,2]) == "dock"}
assert {boggle_board1.create_word([0,1],[0,2],[1,2]) == "rad"}  


#Driver code for get_row method
assert {boggle_board1.get_row(1) ==  "brae"}
assert {boggle_board1.get_row(2) ==  "iodt"}
assert {boggle_board1.get_row(3) ==  "eclr"}
assert {boggle_board1.get_row(4) ==  "take"}


 #Driver code for get_col method
 assert {boggle_board1.get_col(1) ==  "biet"}
 assert {boggle_board1.get_col(2) ==  "roca"}
 assert {boggle_board1.get_col(3) ==  "adlk"}
 assert {boggle_board1.get_col(4) ==  "etre"}


 # Test code for diagonals


# In our rows, we have one real word "take" in row 4. In our columns, we don't have any real words.



# 1. DRIVER TESTS GO BELOW THIS LINE

# Here practiced Object Oriented Programming. I love it because it makes sense logically versus procedurally. 
# create driver test code to retrieve a value at a coordinate here:
# implement tests for each of the methods here:
# Made assert tests.
# Changed in refactored to return strings not arrays
# When i created transpose my error tests helped me wich was awesome

# 5. Reflection 
# I used a class last week. Changes I made this week were incorporating .transpose and also looked at Matrix class in Ruby Doc to figure out
# the diagonal part.
#I feel pretty comfortable with creating, accessing, and traversing nested data structures. I also feel comfortable with implementing a basic Ruby class and identifying when to use instance variables.