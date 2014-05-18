# U2.W4: Add it up!

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  

# I worked on this challenge [by myself: ].

# 1. Pseudocode

# What is the input?
# What is the output? (i.e. What should the code return?)
# What are the steps needed to solve the problem?

=begin
	

1. Define total as a method that takes a single argument, array: def total (Array)

2. Return the sum of array

3. Define sentence_maker as a method that requires a single argument, array, of
strings or numbers: def sentence_maker (array)

4. Return each element joined into a sentence.

5. Capitalize the first letter. (first letter. capitalize!)

6. End the sentence with a period. 







# 2. Initial Solution

def total (array)
	total=0
	array.each do |x| 
		total+=x
	end
	return total
end

def sentence_maker (array) 
	array[0].capitalize!
	arraynew=array.join("")
	return #{arraynew} + "."
end


=end


# 3. Refactored Solution
# I added a space between the quotation marks in array.join so the words wouldn't
# be smooshed together. I also took out the string interpolation since this wasn't
# necessary to print the new array. I changed the name of arraynew to sentencearray
# to make the name more intuitive.

def total (array)
	total=0
	array.each do |x| 
		total+=x
	end
    total
end

def sentence_maker (array) 
	array[0].capitalize!
	sentencearray=array.join(" ")
    sentencearray + "."
end


=begin

# 4. Reflection 
What parts of your strategy worked? What problems did you face?
When I tried to install rspec, I got an error message which led me to using sudo to install
the gem. In Stack Overflow, it said that this isn't the preferred way to install a gem,
but I was afraid that if I tried to use RVM, I would damage my computer's version of Ruby
since I don't know enough about RVM. I do still need to learn how to use RVM. 

What questions did you have while coding? What resources did you find to help you answer them?
I forgot how Array.join works, so I looked it up in the Ruby documentation and found that this was exactly
the right method to use in this instance.

What concepts are you having trouble with, or did you just figure something out? If so, what?
I am having trouble with understanding how to install a gem other than using sudo. 

Did you learn any new skills or tricks?
I learned how to install a gem; what rspec is; how to use rspec in terminal; and how to
apply an rspec file to a ruby file (write require_relative "documentname" at the top of the
rspec file). 

How confident are you with each of the Learning Competencies?
I feel confident with each of the learning competencies.

Which parts of the challenge did you enjoy?
I enjoyed seeing how rspec can be used to test Ruby code and indicate whether the code passes.




=end