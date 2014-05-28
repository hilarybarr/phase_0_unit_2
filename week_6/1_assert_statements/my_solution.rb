# U2.W6: Testing Assert Statements

# I worked on this challenge [by myself ].

# 2. Review the simple assert statement

=begin
def assert
  raise "Assertion failed!" unless yield
end

name = "bettysue"
# Assert 1
 assert {name == "bettysue" }
# Assert 2
 assert {name == "billybob" }

# 2. Pseudocode what happens when the code above runs

# The assert method raises "Assertion failed!" unless yield (meaning unless block that is invoked is true)

#Assert 1: Nothing is printed to the console and the assertion isn't raised because assert 
# yields to the block since what is in the block (name=="bettysue") is true

# Assert 2: Raises "Assertion failed!" as a RuntimeError because assert does not yield to the block
# since what is inside it is false (name != "bettysue"). You can see what line raises this error.

=end

# 3. Copy your selected challenge here

# Week 5, Challenge 3, Guessing Game

class GuessingGame

  def initialize
    @answer=rand(26)
    @solved=false
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

  def play_game
    while true
    last_guess  = nil
    last_result = nil

    until self.solved?
      unless last_guess.nil?
        puts "Oops!  Your last guess (#{last_guess}) was #{last_result}."
        puts ""
      end

      print "Guess a number from 1 to 25: "
      last_guess  = gets.chomp.to_i
      last_result = self.guess(last_guess)
    end

     puts "#{last_guess} was correct!"
     puts "Play again?"
     playagain=gets.chomp
     if playagain.downcase=="yes"
        game=GuessingGame.new
        game.play_game
      else
        break
      end
    end 

  end 
end

=begin

# Original Driver Test Code

game= GuessingGame.new


p game.solved?  # Should return false

p game.guess(27)==:high


=end

# 4. Convert your driver test code from that challenge into Assert Statements

def assert
  raise "Assertion failed!" unless yield
end


game= GuessingGame.new
assert {game.solved? == false } #Should not raise assert
assert {game.guess(27)==:high} # Should not raise assert
assert {game.guess(27)==:low}   # Should raise assert


=begin
# 5. Reflection


What parts of your strategy worked? What problems did you face? What questions did you have 
while coding? What resources did you find to help you answer them? What concepts are you having trouble with, or did you just figure something out? If so, what?
I was able to get my assert statements to function properly by reviewing the example included
in the challenge. I also found that there is a module, Test::Unit::Assertions, although I am not
quite sure how the components of this module operate yet. 

Did you learn any new skills or tricks?
I learned how to write assert statements and realized through experimentation that adding p at the
beginning of a block that is passed to assert prints true or false. I also reviewed blocks, procs, 
and lambdas and feel like I understand the difference better now than when I first learned about
them. Essentially, blocks are chunks of code that get executed. They are not objects. Procs allow
you to save a block as an object and call the block without having to keep rewriting it. Lambdas
are similar to procs except that they check the number of arguments passed to them and pass control
back to the calling method when returned, while a proc returns immediately.

How confident are you with each of the Learning Competencies?
I feel confident about being able to translate driver test code into assert statements.

Which parts of the challenge did you enjoy?
I enjoyed learning a new way to debug code.I also enjoyed that this challenge got me to go back
to an earlier challenge and make some improvements to it.

Which parts of the challenge did you find tedious?
I didn't find any parts of the challenge tedious. 
=end
