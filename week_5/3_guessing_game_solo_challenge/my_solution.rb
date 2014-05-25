# U2.W5: Build a simple guessing game SOLO CHALLENGE


# I worked on this challenge [by myself ].

# 2. Pseudocode

# Input: An integer called answer
# Output: For guess: returns :high, :low, or :correct. 
#         For solved?: returns true or false
# Steps:
=begin
Create a class GuessingGame.
Create an initialize method that takes an integer called answer as a parameter.
	Set the instance variable answer equal to answer.
Create a guess method that takes an integer called guess as a parameter.
	Set the instance variable guess equal to guess.
	If guess > @answer, return :high
	If guess < @answer, return :low
	If guess == @answer, return :correct
Create a solved? method with no parameters.
	If @guess==@answer, return true; else return false.




# 3. Initial Solution

class GuessingGame

  def initialize(answer)
    @answer=answer
   	@solved=false
    raise ArgumentError.new("Error: you must enter an integer") unless @answer.is_a? Integer
  end
  
  def guess(guess)
  	@guess=guess
  	@solved=false
  	if guess > @answer
  		:high
  	elsif guess < @answer
  		:low
  	elsif guess == @answer
  		@solved=true
  		:correct
    end
  end 

  def solved?
	  @solved
  end 

end 

=end



# 4. Refactored Solution
# Everything is the same as above, except I added an interactive component where the user selects
# the guess. I am not sure how to add the interactive component to the class.


class GuessingGame

  def initialize(answer)
    @answer=answer
   	@solved=false
    raise ArgumentError.new("Error: you must enter an integer") unless @answer.is_a? Integer
  end
  
  def guess(theguess)
  	@theguess=theguess
  	@solved=false
  	if @theguess > @answer
  		:high
  	elsif @theguess < @answer
  		:low
  	elsif @theguess == @answer
  		@solved=true
  		:correct
    end
  end 

  def solved?
	  @solved
  end 

end 



while true
game = GuessingGame.new(rand(26))
last_guess  = nil
last_result = nil

until game.solved?
  unless last_guess.nil?
    puts "Oops!  Your last guess (#{last_guess}) was #{last_result}."
    puts ""
  end

  print "Guess a number from 1 to 25: "
  last_guess  = gets.chomp.to_i
  last_result = game.guess(last_guess)
end

 puts "#{last_guess} was correct!"
 puts "Play again?"
 playagain=gets.chomp
 if playagain.downcase=="yes"
    game=GuessingGame.new(rand(26))
  else
    break
end
end 






# 1. DRIVER TESTS GO BELOW THIS LINE

game = GuessingGame.new(10)

p game.solved?  # Should return false

p game.guess(5)==:low
p game.guess(20)==:high
p game.solved? # Should return false

p game.guess(10)==:correct
p game.solved? #Should return true






# 5. Reflection 
=begin

What parts of your strategy worked? What problems did you face? What questions did you have while coding? What resources did you find to 
help you answer them? What concepts are you having trouble with, or did you just figure something out? If so, what?
At first, I had trouble getting GuessingGame#solved? to function properly. I was able to fix this by playing around with where I defined 
instance variables. I also wanted to make it so that the user would be prompted to enter a guess value if they type self.guess, but I wasn't able
to add anything along the lines of guess=gets.chomp to the guess method. The amount of arguments would have then been 0, which would have failed
one of the rspec tests. Instead, I created interactivty outside the class definition, on lines 90 to 105.

Did you learn any new skills or tricks?
I learned that you can exit IRB by typing out "exit".

How confident are you with each of the Learning Competencies?
I feel confident in my ability to implement a basic Ruby class and identify when to use instance variables. I also feel
comfortable explaining how instance variables and methods represent the characteristics and actions of an object.

Which parts of the challenge did you enjoy?
I enjoyed creating a real-world game using classes and methods.

Which parts of the challenge did you find tedious?
I didn't find any parts of the challenge tedious.



=end
	
