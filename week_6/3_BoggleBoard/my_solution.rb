# U2.W6: Create a BoggleBoard Class


# I worked on this challenge [ with: Alan Florendo ].


=begin
# 2. Pseudocode
 Create a Boggle_Board class.
 Define a create_word instance method that takes an undefined amount of coordinates as parameters, maps over all the coordinates
     and turns the content of the coordinates into a string.
 Define a get_row method that returns the contents of a row as a string.
 Define a get_col method that returns the contents of a column as a string.
 Define a get_diagonal method that returns the contents of a diagonal as a string.

=end

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




# 4. Refactored Solution: returns row, col, and diagonals as strings


class Boggle_Board

  attr_reader :board

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
  def get_diagonal(coord1, coord2)
    if (coord1.first-coord2.first) != (coord1.last-coord2.last)
       raise ArgumentError.new("Not part of a diagonal")
    else 
      diagonal=[]
      row=coord1.first
      column=coord1.first
      if coord1.first < coord2.first    # if top left to bottom right diagonal/ negative slope
        until coord2.first < row
          diagonal << @board[row][column]
          row +=1
          column +=1
        end
      else        # bottom left to top right diagonal/ positive slope
        until coord2.first > row
          diagonal << @board[row][column]
          row -=1
          column -=1
        end 
      end
     end
     return diagonal.join("")
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


# Driver test code for accessing individual coordinate
# Driver test for get_letter method
assert {boggle_board1.create_word([3,2])=="k"}

# Driver code for create_word method
assert {boggle_board1.create_word([2,1],[1,1],[1,2],[0,3]) == "code"} 
assert {boggle_board1.create_word([1,2], [1,1], [2,1], [3,2]) == "dock"}
assert {boggle_board1.create_word([0,1],[0,2],[1,2]) == "rad"}  


#Driver code for get_row method
assert {boggle_board1.get_row(1) == "brae"}
assert {boggle_board1.get_row(2) == "iodt"}
assert {boggle_board1.get_row(3) == "eclr"}
assert {boggle_board1.get_row(4) == "take"}


#Driver code for get_col method
assert {boggle_board1.get_col(1) == "biet"}
assert {boggle_board1.get_col(2) == "roca"}
assert {boggle_board1.get_col(3) == "adlk"}
assert {boggle_board1.get_col(4) == "etre"}

#Driver code for get_diagonal method
assert {boggle_board1.get_diagonal([0,0], [1,1])=="bo"}
assert {boggle_board1.get_diagonal([0,0], [3,3])=="bole"}
assert {boggle_board1.get_diagonal([3,3], [0,0])=="elob"}
assert {boggle_board1.get_diagonal([2,2], [0,0])=="lob"}

# In our rows, we have one real word "take" in row 4. In our columns, we don't have any real words.

=begin
  
# Reflection

What parts of your strategy worked? What problems did you face? What questions did you have while coding? What resources did you find to help you answer them? What concepts are you having trouble with, or did you just figure something out? If so, what?

I like Object-Oriented design since it seems logical and structured.
Writing the first three methods came easy to me after last week's challenge but I struggled with the get_diagonal method. I was having a hard time
visualizing how it would work, so I wrote out all the possible coordinate combinations that would work with this method:

Some negative slope diagonals
[0,0], [1,1]
[0,0], [1,1], [2,2]
[0,0], [1,1], [2,2], [3,3]
[1,1], [2,2]
[1,1], [2,2], [3,3]
[2,2], [3,3]

[0,1][1,2]....etc


Some positive slope diagonals
[3,3], [2,2], [1,1], [0,0]
[3,3], [2,2], [1,1]
[3,3], [2,2]
[2,2], [1,1], [0,0]
[2,2], [1,1]
[1,1], [0,0]

[1,2][0, 1].....etc


Seeing this written out made me realize that there is a relationship between the first element of each coordinate and the last element of each
coordinate. Namely, the first element of one coordinate subtracted from the other should equal the second element of the coordiante subtracted
from the other; otherwise it is not a diagonal. I also realized that the way to include all the in-between coordinates when creating the diagonal
would be to use something along the lines of x+=1 and y+=1 and x-=1 and y-=1 as part of a while or unless loop, and that there would need to be
a different while or unless loop for positive and negative slope diagonals. Admittedly, I did take a look at some other solutions on Stack Overflow
when I was really stuck, but I wanted to work through the logic on my own, which was why I wrote out all the possible solutions.




Did you learn any new skills or tricks?
I learned that it would be possible to print the board at any time by writing an attr_reader for board.
I also learned about the Array#transpose method, which swaps columns with rows. Even though I didn't end up incorporating it here, I also learned about
the Matrix class. The Matrix class provides methods for  creating matrices, operating on them arithmetically and algebraically, and determining 
their mathematical properties. To use the Matrix class, you have to require Matrix since it is a standard library. I didn't use the Matrix class, 
even though it has a .diagonal method, because it seems you can only use it with numbers. Another thing I learned about which wasn't really relevant
to this lesson was  the .grep method. Let's say we wanted to see if the letter "a" was in our boggle board. We could write 
boggle_board1.grep(/a/) and it would return any instances with the letter "a." I want to explore pattern matching and Regular Expressions more.
Also, I learned about the fetch method, which I also didn't use here but could have used. Fetch returns the element at a specified position. 
This is different from .index, which returns the index of what is specified.



How confident are you with each of the Learning Competencies?
I feel pretty comfortable with creating, accessing, and traversing nested data structures. I also feel comfortable with implementing a 
basic Ruby class and identifying when to use instance variables.

Which parts of the challenge did you enjoy?
I enjoyed figuring out the get_diagonal method after being stuck on it for awhile. 

Which parts of the challenge did you find tedious?
I didn't find any parts of the challenge tedious.

=end




