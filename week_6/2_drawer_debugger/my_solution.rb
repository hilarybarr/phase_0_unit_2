# U2.W6: Drawer Debugger


# I worked on this challenge [by myself ].


=begin
# 2. Original Code



class Drawer

attr_reader :contents

# Are there any more methods needed in this class?

def initialize
@contents = []
@open = true
end

def open
@open = true
end

def close
@open = false
end 

def add_item
@contents << item
end

def remove_item(item = @contents.pop) #what is `#pop` doing?
@contents.delete(item)
end

def dump  # what should this method return?
puts "Your drawer is empty."
end

def view_contents
puts "The drawer contains:"
@contents.each {|silverware| puts "- " + silverware.type }
end


class Silverware
attr_reader :type

# Are there any more methods needed in this class?

def initialize(type, clean = true)
@type = type
@clean = clean
end

def eat
puts "eating with the #{type}"
@clean = false
end

end

knife1 = Silverware.new("knife")

silverware_drawer = Drawer.new
silverware_drawer.add_item(knife1) 
silverware_drawer.add_item(Silverware.new("spoon"))
silverware_drawer.add_item(Silverware.new("fork")) 
silverware_drawer.view_contents

silverware_drawer.remove_item
silverware_drawer.view_contents
sharp_knife = Silverware.new("sharp_knife")


silverware_drawer.add_item(sharp_knife)

silverware_drawer.view_contents

removed_knife = silverware_drawer.remove_item(sharp_knife)
removed_knife.eat
removed_knife.clean_silverware 

silverware_drawer.view_contents
silverware_drawer.dump
silverware_drawer.view_contents #What should this return?


fork = silverware_drawer.remove_item(fork) #add some puts statements to help you trace through the code...
fork.eat

#BONUS SECTION
# puts fork.clean









=end

#Refactored 

class Drawer

	attr_reader :contents

# Are there any more methods needed in this class? I don't believe so. I just added within the methods

	def initialize
		@contents = []
		@open = true     
	end

	def open
		@open = true
	end

	def close
		@open = false
	end 

	def add_item (item)
		@contents << item
	end

	def remove_item(item = @contents.pop) #what is `#pop` doing? #Pop removes item at the end of array
		@contents.delete(item)
	end

	def dump  # This should return an empty drawer, so I reset @contents to empty array
		puts "Your drawer is empty."
		@contents=[]
	end

	def view_contents   # I added a different return for if contents is empty
		if @contents.empty?
			  "The drawer is empty."
		else
			puts "The drawer contains:"
			@contents.each {|silverware| puts "- " + silverware.type }
		end
	end
end 


class Silverware
	attr_reader :type, :clean    # I added :clean to get the bonus (fork.clean) to work

# Are there any more methods needed in this class? Yes, I added clean_silverware

	def initialize(type, clean = true)
		@type = type
		@clean = clean
	end

	def eat
		puts "eating with the #{type}"
		@clean = false
	end

	def clean_silverware
		@clean=true
	end

end



knife1 = Silverware.new("knife")

silverware_drawer = Drawer.new
silverware_drawer.add_item(knife1) 

p silverware_drawer.open
# I created a fork and spoon object
fork=Silverware.new("fork")
silverware_drawer.add_item(fork)
spoon=Silverware.new("spoon")
silverware_drawer.add_item(spoon)
silverware_drawer.view_contents


silverware_drawer.remove_item
silverware_drawer.view_contents

sharp_knife = Silverware.new("sharp_knife")
silverware_drawer.add_item(sharp_knife)
silverware_drawer.view_contents

removed_knife = silverware_drawer.remove_item(sharp_knife)
removed_knife.eat
removed_knife.clean_silverware 

silverware_drawer.view_contents
silverware_drawer.dump
silverware_drawer.view_contents

fork.eat
p fork.clean
fork.clean_silverware
p fork.clean





# DRIVER TESTS GO BELOW THIS LINE

def assert
  raise "Assertion failed!" unless yield
end

testsilverware = Silverware.new("spork")
testdrawer = Drawer.new

# assert {testdrawer.open == false }  # Raise assertion
assert {testdrawer.open == true }
assert {testdrawer.close == false }
#assert { testsilverware.clean == false } # Raise assertion
assert { testsilverware.clean_silverware == true }
assert { testsilverware.clean == true }
assert {testdrawer.view_contents == "The drawer is empty." }
assert {testdrawer.instance_variable_get(:@contents) == []}
testdrawer.add_item(testsilverware)
# assert {testdrawer.view_contents == "The drawer is empty." } # Raise assertion
assert {testsilverware.instance_variable_get(:@clean) == true}



=begin
# 5. Reflection 


What parts of your strategy worked? What problems did you face? What questions did you have while coding? What resources did you find to help you answer them? What concepts are you having trouble with, or did you just figure something out? If so, what?
I wasn't sure why fork.eat wasn't working at first, then I realized by carefully going through the code again that it was because fork had been 
set to an instance variable but not an object. By defining fork as an object and then adding it to silverwaredrawer, I was able to get the code to
pass (as in lines 183-184).

Initially, I added a .clean? method to get fork.clean to pass but realized it would pass if I added :clean to attr_reader, because this would
enable a user to read whether clean is set to true or false. 

I also realized that I needed to set @contents to an empty hash to get .dump to work properly.

I am still a bit unsure about when to use puts inside a method definition. My instinct was to try to remove it, but I wasn't able to figure out how to
do so in a way that the code would still pass yet.



Did you learn any new skills or tricks?
I refreshed my understanding of blocks, procs, and lambadas. I also learned about the instance_variable_get method, 
which returns the value of a given instance method.

How confident are you with each of the Learning Competencies?
I feel confident about being able to use error messages to correct syntax messages and/or drive development and about defining a method's 
responsibility.

Which parts of the challenge did you enjoy?
I enjoyed using error messages to debug the code step-by-step. I also enjoyed learning more about blocks, procs, and lambdas.

Which parts of the challenge did you find tedious?
I didn't find any parts of the challenge tedious.


=end
