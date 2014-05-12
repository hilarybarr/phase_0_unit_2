# U2.W4: Calculate the mode!

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  

# I worked on this challenge [by myself, with: ].

# 1. Pseudocode

# What is the input?
# What is the output? (i.e. What should the code return?)
# What are the steps needed to solve the problem?
=begin

Write a method mode which takes an array of numbers or strings as its input.

Set frequencies to a hash with an initial value of 0.

Iterate over the array, adding the frequency of each element to the hash.

Sort the frequencies hash by frequency.

Set max equal to the max of the values.

Keep key-value pairs only if the frequency is equal to the max.

Return the remaining keys in the frequencies hash (returns an array of the most frequent
values). 



# 2. Initial Solution


def mode (array)
	frequencies=Hash.new(0)

	array.each {|x| frequencies[x] +=1; }

	frequencies.sort_by {|x, frequency| frequency}
	max=frequencies.values.max
	frequencies.keep_if {|x, frequency| frequency==max}
	return frequencies.keys
end


=end

# 3. Refactored Solution
# I changed x to element to make what it represents more intuitive. I also deletd
# the sort_by method since it wasn't necessary.

def mode (array)
	frequencies=Hash.new(0)
	array.each {|element| frequencies[element] +=1; }
	max=frequencies.values.max
	frequencies.keep_if {|element, frequency| frequency==max}
	return frequencies.keys
end



=begin
# 4. Reflection 

This was similar to an activity on Codecademy, so I knew how to
add each element's frequency to a hash. I also knew to set the Hash values initially
to 0 and to add the frequency of each element to the hash when iterating over the array.

I learned about the keep_if method by browsing the Ruby specification. This proved to be
a very useful method since it made it possible to return any values that were the mode,
rather than just the frequency or the entire hash key-value pair.

I also learned about the .max method by browsing the Ruby documentation. This made it possible
to delete my sort_by method, which made the code more consise.

I enjoyed applying new methods from the Ruby specification and didn't mind this challenge
tedious in any way.


=end