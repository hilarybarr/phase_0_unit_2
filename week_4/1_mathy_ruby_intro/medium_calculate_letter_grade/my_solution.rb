# U2.W4: Calculate a letter grade!

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  

# I worked on this challenge [by myself, with: ].

=begin

# 1. Pseudocode

# What is the input?
# What is the output? (i.e. What should the code return?)
# What are the steps needed to solve the problem?


1. Create a method get_grade that accepts an array of test scores.

2. Each score in the array should be between 0 and 100, where 100 is the max score.

3. Compute the average score (sum of array/ array.length).

4. Write an if-else statement that attaches average scores to a letter grade.

4. Return the letter grade as a String, i.e. "A", "B", "C", "D", or "F."






# 2. Initial Solution

def get_grade (array)
	
	total=0
	array.each do |x|
		 total += x
	end


	average= (total.to_i/array.length.to_i)
	

	if average >= 90
		 return "A"
	elsif average >= 80
		return "B"
	elsif average >= 70
		return "C"
	elsif average >= 60
		return "D"
	elsif average <60
		return "F"
	else
		return "F"
	end
end

	
=end

	



# 3. Refactored Solution
# I turned the if-else statements into a case block.

def get_grade (array)
	
	total=0
	array.each do |x|
		 total += x
	end


	average= (total.to_i/array.length.to_i)
	

	case average
		when 90..100
			return "A"
		when 80..89
			return "B"
		when 70..79
			return "C"
		when 60..69
			return "D"
		when 0..59
			return "F"
		else
			return "Error"
	end

end


=begin
# 4. Reflection 

What parts of your strategy worked? What problems did you face?
I found writing the pseudocode and planning how this problem would work to be fairly straightforward. Yet my code didn't pass for
awhile. I kept staring at it and not seeing anything wrong. After taking a short break, I found that I had written grade_grade rather 
than get_grade. It reaffirmed the need to occasionally step away from your code so you can come back to it with a fresh perspective. 

What questions did you have while coding? What resources did you find to help you answer them?
I forgot how to write a case block so I consulted Codecademy.

What concepts are you having trouble with, or did you just figure something out? If so, what?
I learned that you don't write array[x] inside an each method in Ruby; you just write x.

Did you learn any new skills or tricks?
I learned that it is possible to use .. to indicate a range of numbers so that I can write 90..100 versus something like when 90 <=x<=100.


How confident are you with each of the Learning Competencies?
I am confident wth each of the objectives.

Which parts of the challenge did you enjoy?
I enjoyed figuring out why my code wasn't working and seeing the driver test code verify when the code passed.

Which parts of the challenge did you find tedious?
I didn't find any part of the challenge tedious.

=end
