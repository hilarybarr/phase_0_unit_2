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
		puts "A new pez dispenser has been created. You have "+ @count.to_s+ " pez! Here's a look inside the dispenser: #{self.see_all_pez}." 
	end

	def pez_count
		 puts "Now you have #{@count} pez."
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

assert {super_mario.instance_variable_get(:@count)==10}

super_mario.pez_count

super_mario.get_pez

assert {super_mario.instance_variable_get(:@count)==9}

p super_mario.see_all_pez







# 5. Reflection 
=begin

What parts of your strategy worked? What problems did you face? What questions did you have while coding? What resources did you find to help you answer them? What concepts are you having trouble with, or did you just figure something out? If so, what?

When designing my class, I wasn't sure whether it was necessary to increment @counter in add_pez and get_pez but found that my driver test code 
wouldn't pass unless I did.  Also, @count returned nil unless I included it in the initialization. Writing assert statements helped me figure 
this out, so I am glad we learned them.

I also wasn't able to get pez_count to pass the assert test with a puts statement inside the method as well as the @count, and I realized that
it would pass if I used instance_method_of(:@count) instead. 


Did you learn any new skills or tricks?
I learned how to use .shift and .unshift. I also learned that you can create an array of strings using %w{word word word etc}. 


How confident are you with each of the Learning Competencies?
I feel comfortable with implementing a basic Ruby class and identifying when to use instance variables. I am also comfortable with 
translating a user story into driver code and solutions. I am not as comfortable with translating driver test code into a class structure using
object-oriented design yet. I am still a bit unclear on when to use puts inside method defintions versus when calling a method. I am also a bit
unclear on what exactly could have been tested by assert statements in this challenge other than super_mario.instance_variable_get(:@count).

Which parts of the challenge did you enjoy?
I enjoyed using object-oriented design to model something from the real world...and besides, how could I not enjoy building something that involves
candy? 

Which parts of the challenge did you find tedious?
I got stuck for awhile and was unable to get my driver test code to pass. I felt like I was trying the same thing over and over until I
made some dramatic changes to my methods that got the code to pass.

# Neede dto incromenet
# Couldn't get my driver test code instance_variable_get(@count) to pass, it wanted nil not 9, then realize I needed to initialize count for driver code
# to work.
#I added what was originally in driver code to class itself
#remove from top 
#add to end

#I couldn't envision how a pez works (i.e. when you put a pez in does it go to top or bottom and do you take out of top or bottom?)
# I felt the pseucodoe was helpful here
# .shuffle

=end