# U2.W4: Pad an Array

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  

# I worked on this challenge [by myself, with: ].

# 1. Pseudocode

# What is the input? A minimum padded array size and optional pad value initially set to nil.
# What is the output? (i.e. What should the code return?) A padded array.
# What are the steps needed to solve the problem?

=begin
	

Create a class called Array.

Create a method pad! which takes a minimumsize and optional pad value (initially set to nil) as its parameters.

If minimumsize <= self.length, return self.

Else, fill the end of the array with the  minimumsize-self.length times and return self.

Create a method pad which takes a minimumsize and optional pad value (initially set to nil) as its parameters.

If minimumsize <= self.length, return self.clone.

Else, set padarray to self.clone and append padvalue to padarray minimumsize-self.length times.

Return padarray.




# 2. Initial Solution

class Array


	def pad! (minimumsize, padvalue=nil)

		if self.length < minimumsize
			self.fill(padvalue, self.size..minimumsize)
		end

		return self 
	end

	def pad (minimumsize, padvalue=nil)
		if minimumsize <= self.length
			return self.clone
		else
			padarray=self.clone
			(minimumsize - self.length).times {padarray << padvalue}
			return padarray
		end 
	end

end

=end


# 3. Refactored Solution


	

class Array
# Created while loop since the code seemed less complex than using the fill method. Removed unnecessary returns.
# Moved some if statements onto one line.

	def pad! (minimumsize, padvalue=nil)

		return self if minimumsize <= self.length

		while minimumsize > self.length 
			self << padvalue
		end

		self 
	end


	def pad (minimumsize, padvalue=nil)
		return self.clone if minimumsize <= self.length
			
		padarray=self.clone
		(minimumsize - self.length).times {padarray << padvalue}
		padarray
	 
	end

end





	



# 4. Reflection 





# Hard time writing pseudocode, find it's easier for me to write pseudocode after challenge but I know we're supposed
# to write it first.




=begin
What parts of your strategy worked? What problems did you face?
This was difficult for me because I wanted to solve as much of the challenge on my own as possible but felt like I
wasn't sure what to do. It was hard to find the balance between Googling for help and not copying others' solutions.  
I still am trying to figure this balance out.

What questions did you have while coding? What resources did you find to help you answer them? What concepts are you having trouble with, or did you just figure something out? If so, what?
Did you learn any new skills or tricks?
I was confused about whether to define array inside the method. Browsing through Stack Overflow, I learned that pad methods 
are best defined inside a class called Array. Once I realized this, writing the solutions came easier to me. I also
realized that it is not necessary to explicitly return.


How confident are you with each of the Learning Competencies?
I understand the role that .clone played in my code but don't understand the difference between when to use
.clone and .dup. I also don't fully understand how to write a method differently when you want it to be destructive vs.
non-destructive. I will discuss this during office hours later this week.

Which parts of the challenge did you enjoy?
I enjoyed learning more about destructive and nondestructive methods and learning new Array methods. 

Which parts of the challenge did you find tedious?
I didn't find any parts of the challenge tedious. Writing both a destructive and non-destructive method side-by-side and
comparing them was helpful.
=end

