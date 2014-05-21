# U2.W5: A Nested Array to Model a Boggle Board

# I worked on this challenge [with: Alan Florendo].

=begin
# Pseudocode:
Create class Boggle_Board.
    Create initialize method with user-defined board as argument.
        Raise error if board is empty.
    Create create_word method with *coords as splat argument.
        Use .join method to concatenate letters at given coordinates.
        Return word as a string made up of those letters.
    Create get_row method with a row number argument.
        Return row array based on user input of row number.
    Create get_col method with a column number argument.
        Loop through each row.
        Return an array of letter values in given column position.
=end



# I worked on this challenge [by myself, with: ].
class Boggle_Board
    def initialize(board)    
        if board.empty?     
            raise ArgumentError.new("Board cannot be empty")
        else
            @board = board
        end
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
    col_array=[]
    for i in 0...@board.length do
        col_array << @board[i][col-1]
    end
    col_array
  end
end
  

boggle_board2 = Boggle_Board.new(  [["b", "r", "a", "e"],
                                    ["i", "o", "d", "t"],
                                    ["e", "c", "l", "r"],
                                    ["t", "a", "k", "e"]] )



#Driver Test Code
  p boggle_board2.create_word([2,1],[1,1],[1,2],[0,3]) == "code"  #=> returns "code"  
  p boggle_board2.create_word([0,1],[0,2],[1,2]) == "rad"  #=> creates what california slang word?
  p boggle_board2.get_row(3) ==  ["e", "c", "l", "r"]
  p boggle_board2.get_row(1) ==  ["b", "r", "a", "e"]
  p boggle_board2.get_col(1) ==  ["b", "i", "e", "t"]
  # p boggle_board3=Boggle_Board.new([]) # Should return argument error



=begin

#Reflection

What parts of your strategy worked? What problems did you face?
# We weren't sure whether we needed to define a class at first but felt this might be a good idea, so we tweaked each method
to make it work within a Boggle_Board class. Our driver code wasn't passing at first, and we realized that we needed to rewrite
it such that we initialized an object set equal to the array and then called the methods on the object.

What questions did you have while coding? What resources did you find to help you answer them? What concepts are you having trouble 
with, or did you just figure something out? If so, what?
Our for loop wasn't returning col_array until we explicitly returned col_array, but we didn't understand why an explicit return was 
needed there. We also weren't sure about the difference in when to use self versus the instance variable name when writing methods
within a class. We did some research on Stack Overflow and it appears that you use self when you haven't initialized
an object. So for example, the class defining Integer would include self if you could write 5=Integer.new(). But you would use
@integer when writing the Integer class if you were able to write my_integer=Integer.new(5).

Did you learn any new skills or tricks?
Alan taught me how to use a for loop to determine which letters should be returned in our get_col method.

How confident are you with each of the Learning Competencies?
I feel pretty confident about creating, accessing, and traversing nested data structures; explaining how data structures and 
classes can model a real-world object; and explaining how instance variables and methods represent the characteristics and 
actions of an object.

Which parts of the challenge did you enjoy?
I enjoyed solving this challenge through pair programming and gaining new insights into writing classes from working with
someone else.

Which parts of the challenge did you find tedious?
Writing the pseudocode after the fact was a bit tedious since we felt that the code and the comments we included in the 
code spoke for themsleves.

=end

