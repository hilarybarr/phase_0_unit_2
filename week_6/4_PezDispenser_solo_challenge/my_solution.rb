# U2.W6: PezDispenser Class from User Stories


# I worked on this challenge [by myself ].

# 1. Review the following user stories:
# - As a pez user, I'd like to be able to "create" a new pez dispenser with a group of flavors that 
#      represent pez so it's easy to start with a full pez dispenser.
# - As a pez user, I'd like to be able to easily count the number of pez remaining in a dispenser 
#      so I can know how many are left.
# - As a pez user, I'd like to be able to take a pez from the dispenser so I can eat it.
# - As a pez user, I'd like to be able to add a pez to the dispenser so I can save a flavor for later.
# - As a pez user, I'd like to be able to see all the flavors inside the dispenser so I know the order 
#      of the flavors coming up.


# 2. Pseudocode

# Input: add flavors to a pez dispenser (add elements to an array)
# Output: remove flavor from a pez dispenser (pop element from array)
# Create class PezDispenser
# Add initialize instance method that takes flavors as a parameter
# Add pez_count instance method that outputs total amount of pez in flavors array
# Add see_all_pez instance method that outputs all the flavors in the flavors array
# Add add_pez instance method that takes a pez in string format as a parameter and adds it to end of array
# Add get_pez method that shifts first pez out of array and returns the pez that was removed.

# 3. Initial Solution


=begin

# This was how the code looked originally. As you can see in the refactored code, I added some of the strings to the class.

flavors = %w(cherry chocolate cola grape lemon orange peppermint raspberry strawberry).shuffle
super_mario = PezDispenser.new(flavors)
puts "A new pez dispenser has been created. You have #{super_mario.pez_count} pez!"  
puts "Here's a look inside the dispenser:"  
puts super_mario.see_all_pez 
puts "Adding a purple pez."
super_mario.add_pez("purple")   # mmmmm, purple flavor
puts "Now you have #{super_mario.pez_count} pez!"
puts "Oh, you want one do you?"
puts "The pez flavor you got is: #{super_mario.get_pez}"
puts "Now you have #{super_mario.pez_count} pez!"

=end




# 4. Refactored Solution






class PezDispenser
 
	def initialize (flavors)
		raise ArgumentError.new("You must enter an array") if flavors.empty?
		@flavors=flavors
		@count=flavors.count
		puts "A new pez dispenser has been created. You have " + @count.to_s+ " pez! Here's a look inside the dispenser: #{self.see_all_pez}." 
	end

	def pez_count
		 puts "Now you have #{@count} pez."
		 @count
	end

	def see_all_pez
	      @flavors
	end

	def add_pez(flavor)
		puts "Adding a #{flavor} pez. Mmm, a #{flavor} flavor."
		@flavors << flavor
		@count+=1
	end

	def get_pez
		removed=@flavors.shift
		puts "Oh, you want one do you? The pez flavor you got is: #{removed}"
		@count-=1
	end

end
 

# 1. DRIVER TESTS GO BELOW THIS LINE

def assert
  raise "Assertion failed!" unless yield
end


flavors = %w(cherry chocolate cola grape lemon orange peppermint raspberry strawberry).shuffle
super_mario = PezDispenser.new(flavors)



# assert {fakepez=PezDispenser.new}  # Should get wrong number of arguments message

assert {super_mario.instance_variable_get(:@count)==9}


super_mario.add_pez("purple")

p super_mario.see_all_pez

assert {super_mario.see_all_pez.sort == flavors.sort}

assert {super_mario.instance_variable_get(:@count)==10}

# assert {super_mario.pez_count==10}   # This prints to true but it also prints the result of method?

super_mario.pez_count

super_mario.get_pez

assert {super_mario.instance_variable_get(:@count)==9}

super_mario.pez_count

p super_mario.see_all_pez




# 5. Reflection 
=begin

What parts of your strategy worked? What problems did you face? What questions did you have while coding? What resources did you find to help you answer them? What concepts are you having trouble with, or did you just figure something out? If so, what?

When designing my class, I wasn't sure whether it was necessary to increment @counter in add_pez and get_pez but found that my driver test code 
wouldn't pass unless I did.  Also, @count returned nil unless I included it in the initialization. Writing assert statements helped me figure 
this out, so I am glad we learned them.

I realized that if I set the return value of pez_count to @count, I could write super_mario.pez_count==10 as a driver method, but not if the
puts statement was the last line of the method. I learned that even if the return value isn't printed, it's still noted.
I am confused why string interpolation worked for @count on line 70 but not 65.


Did you learn any new skills or tricks?
I learned how to use .shift and .unshift. I also learned that you can create an array of strings using %w{word word word etc}. 
In addition, I learned that you can use super_mario.get_pez.sort==flavors.sort as driver test code.

How confident are you with each of the Learning Competencies?
I feel comfortable with implementing a basic Ruby class and identifying when to use instance variables. I am also comfortable with 
translating a user story into driver code and solutions. I am not as comfortable with translating driver test code into a class structure using
object-oriented design yet. 

Which parts of the challenge did you enjoy?
I enjoyed using object-oriented design to model something from the real world...and besides, how could I not enjoy building something that involves
candy? 

Which parts of the challenge did you find tedious?
I didn't find any parts of the challenge tedious. I got stuck for awhile but it was part of the learning process.


=end