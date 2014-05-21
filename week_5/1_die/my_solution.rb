# U2.W5: Die Class 1: Numeric


# I worked on this challenge [by myself].

# 2. Pseudocode
=begin
# Input: Sides
# Output: self.sides= number of sides; self.roll=1+rand(# of sides)
# Steps:

Create a class Die
Create an initialize method that takes sides as a parameter.
	If sides <1, raise ArgumentError.
	Else, set instance variable sides (@sides) equal to sides.
Create a sides method that returns @sides.
Create a roll method that returns 1+rand(@sides).
=end

# 3. Initial Solution

class Die
  def initialize(sides)
    if sides < 1
    	raise ArgumentError.new("Sides can't be less than 1")
    else
    	@sides=sides
    end
  end
  
  def sides
   @sides
  end
  
  def roll
   1+rand(@sides)
  end
end



# 4. Refactored Solution

# I couldn't think of anything to change in the code. This appears to be the minimum
# amount of code necessary to initialize a Die object and to create each method and
# define instance variables.




# 1. DRIVER TESTS GO BELOW THIS LINE

# Should the driver test code apply to any instantiation or just to examples?
# How to incorporate random and initialize?

die1= Die.new(1)
die2= Die.new(2)
die3= Die.new(3)

#Tests to make sure sides greater than or equal to 1
# Die.new(0) # raises argument error

#Tests sides
p die1.sides==1
p die2.sides==2
p die3.sides==3

# Tests roll
p die1.roll==1+rand(1)
p die2.roll==1+rand(2)
p die3.roll==1+rand(3)








=begin
# 5. Reflection 


What parts of your strategy worked? What problems did you face? What questions did you have while coding? What resources did you find to help you answer them?
I wasn't sure how to create classes and instantiations, so I completed the Codecademy lesson on this. I also read the relevant
section in Pickaxe and Chris Pine's Learn to Program. Writing the class came easily to me after consulting these resources. 

What concepts are you having trouble with, or did you just figure something out? If so, what?
I was having trouble writing driver code and didn't understand why my tests were failing. After browsing through a later challenge, I saw an example
that made everything click in my head. The missing link in my understanding was that I thought all driver test code that we create in a .rb document
needs to be set == to something. For example, p die3.roll==1+rand(3). So I thought that if you wanted to show that something would raise an argument
error, you had to set the method equal to the argument error itself. Instead, I learned that you keep the argument error test in comments
and don't set it equal to anything, such that if you remove the comment the error would be raised, as in line 61.

Did you learn any new skills or tricks?
I learned how to create a class, define methods within a class, and create instance methods. I also learned how to indicate
a random number.

How confident are you with each of the Learning Competencies?
I am confident about implementing a basic Ruby class, identifying when to use instance variables, and creating methods
within classes. I am not completeyly confident about writing driver test code, although I am starting to feel more comfortable with
understanding what is happening in rspec code.

Which parts of the challenge did you enjoy?
I enjoyed learning more about classes and object-oriented programming since they are part of what make Ruby such a special
language.

Which parts of the challenge did you find tedious?
I didn't find any parts of the challenge tedious.

=end