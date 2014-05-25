# U2.W5: Die Class 2: Arbitrary Symbols


# I worked on this challenge [by myself].

# 2. Pseudocode

# Input: An array representing labels on a dice.
# Output: A randomly selected element in the array representing a side of the dice.
# Steps:

=begin

Create a class Die.

Define a method intialize that takes an array, labels, as its argument.
  If labels is empty, raise an argument error.
  Else, the instance variable @labels equals labels.

Define a method sides, which outputs the length of the @labels array.

Define a method, roll, which outputs a randomly selected element in the @labels array.

Initialize an object of the Die class that takes an array as its argument and test the methods .sides and .roll.

=end

# 3. Initial Solution





=begin
class Die

  def initialize(labels)
  	if labels.empty?
  		raise ArgumentError.new("The array is empty.")
  	else
  		@labels=labels
  	end
  end

  def sides
  	@labels.length
  end

  def roll
  	@labels.sample
  end

end
=end






# 4. Refactored Solution
#I took out my if-else statement.

class Die

  def initialize(labels)
      raise ArgumentError.new("The array is empty.") if labels.empty?
      @labels=labels
  end

  def sides
    @labels.length
  end

  def roll
    @labels.sample
  end

end



# 1. DRIVER TESTS GO BELOW THIS LINE

die=Die.new(["A", "B", "C", "D", "E", "F"])

p die.sides==6

p die.roll #Should get random side under 6

empty=Die.new([]) # Should get argument error



=begin
# 5. Reflection 
What parts of your strategy worked? What problems did you face? What questions did you have while coding? What resources did you find to help you answer them?
I felt like I understood how to do this challenge as soon as I opened it after having gone through Challenge 1. 
It required essentially the same way of thinking.

What concepts are you having trouble with, or did you just figure something out? If so, what?
I am still not 100% clear on how to write driver test code, so I will discuss this during office hours.

Did you learn any new skills or tricks?
I learned how to include .sample and .empty in my code, both of which are awesome methods.

How confident are you with each of the Learning Competencies?
I am confident about implementing a basic Ruby class, identifying when to use instance variables, and creating methods
within classes. I am not completeyly confident about writing driver test code, although I am starting to feel more comfortable with
understanding what is happening in rspec code.

Which parts of the challenge did you enjoy?
I enjoyed using .sample and .empty, which I had learned about in the past but hadn't had a chance to write in my code yet.

Which parts of the challenge did you find tedious?
I didn't find any parts of the challenge tedious.
=end