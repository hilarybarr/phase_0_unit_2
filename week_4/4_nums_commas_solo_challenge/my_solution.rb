# U2.W4: Numbers to Commas Solo Challenge

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  

=begin
# 1. Pseudocode

# What is the input? An integer
# What is the output? (i.e. What should the code return?) A string with commas
# What are the steps needed to solve the problem?


Define a method set_comma that takes an integer as input

Set string to integer.to_s

If string.length<4 then return string as is

Elsif string.length >= 4 and < 7 then dd comma to position -4

Elsif string.length >=7 and <= 9 then add comma to position -4 and -8

Return the integer in string format with commas added in the proper places.





# 2. Initial Solution

def separate_comma (integer)

	string=integer.to_s


	if string.length < 4
    	string
	elsif  4<= string.length && string.length< 7
 	   string.insert(-4, ",") 
	elsif 7<= string.length && string.length <= 9   
  	    string.insert(-4, ",") && string.insert(-8, ",")
	else
		"Invalid integer"
	end

end
   

p separate_comma(1000)
p separate_comma(1000000)
p separate_comma(0)   
p separate_comma(100)


=end


# 3. Refactored Solution
# I turned the if-else statements into a case block because it required less code and was cleaner.

def separate_comma (integer)

	string=integer.to_s

	case string.length
	when 0...4
    	string
	when 4...7
 	   string.insert(-4, ",") 
	when 7..9 
  	    string.insert(-4, ",") && string.insert(-8, ",")
	else
		"Invalid integer"
	end

end
   

p separate_comma(1000)
p separate_comma(1000000)
p separate_comma(0)   
p separate_comma(100)



=begin
# 4. Reflection 

What parts of your strategy worked? What problems did you face? What concepts are you having trouble with, or did you just figure 
something out? If so, what?
I wasn't sure how to save the integer as a string since you can't use a bang with .to_s. I tried adding .to_s after every use of 
integer but method chaining wouldn't work. After hitting a wall, I realized that you  can store integer.to_s in a variable and just 
use the variable thereafter. Once I did this and incorporated the .insert method, my code passed the tests!

What questions did you have while coding? What resources did you find to help you answer them?
I was wondering if there was a method for inserting something into a string without replacing any current characters. I searched
through the Ruby specifiction and found that there is in fact a .insert method. This method made writing the code very simple.


Did you learn any new skills or tricks?
I figured out how to use ranges in a case block. This eliminated the need to write lengthy comparators. 


How confident are you with each of the Learning Competencies?
I am very confident about being able to iterate through data structures, use if/else statements, and 
strings methods and work with strings, integers, and other data types.


Which parts of the challenge did you enjoy?
I enjoyed researching methods that would enable me to insert a character into a string in the Ruby specification.

Which parts of the challenge did you find tedious?
I didn't find any parts of the challenge tedious.
=end

