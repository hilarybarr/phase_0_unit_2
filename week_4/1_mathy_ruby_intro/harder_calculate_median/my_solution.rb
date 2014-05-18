# U2.W4: SOLO CHALLENGE Calculate the Median!

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  

# I worked on this challenge [by myself, with: ].

# 1. Pseudocode

# What is the input?
# What is the output? (i.e. What should the code return?)
# What are the steps needed to solve the problem?


=begin
	
Write a method median which takes an array of numbers as its input.

Sort the array.

Half of the array is equal to Math.floor(array.length/2).

Return the median value:

	If array.length is even, return (array[half-1]+ array[half]  /2)

	If array.length is odd, return array[half].





# 2. Initial Solution

Version 1: With if-else statement
def median (array)
	len=array.length
	sorted=array.sort!
	if len % 2==0
		return ((sorted[len/2-1]+ sorted[len/2]).to_f/2)
	else
		return sorted[len/2]
	end
end


=end

# 3. Refactored Solution

# Version 1, with ternary conditional and no variable set to array.sort!

def median (array)
	len=array.length
	array.sort!
	len % 2==0?  ((array[len/2-1]+ array[len/2]).to_f/2):  array[len/2]
end

# Version 2, with half as a variable (I just put this here to show myself)
# that you can do this similarly to how we found the  median in JavaScript
	len=array.length
	array.sort!
	half=len/2
	len % 2==0?  ((array[half-1]+ array[half]).to_f/2):  array[half]
end


=begin
# 4. Reflection 

I thought we needed to use .floor like when writing a median method in
JavaScript, but realized we don't in Ruby because we just turn numbers to floats. 
This caused me some confusion and I still don't fully understand this.

I wasn't sure why we calculated what half was equal to in our JavaScript
median function but not Ruby one. After playing around with the code, I found 
that we can either use the length or half of the length in the code.

I learned how to use the ternary conditional. 

In addition, while I didn't include it in my code, I learned how to use inject
to aggregate data across a dataset. I consulted the Ruby specification and
this video: https://www.youtube.com/watch?v=7XTWKrhXskU.

My favorite part of the challenge was learning about the ternary conditional
because it is easier to write than an if-else statement.

I didn't find any parts of the challenge tedious.

=end