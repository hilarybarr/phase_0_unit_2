# U2.W4: Numbers to Commas Solo Challenge

# Complete each step below according to the challenge directions and 
# include it in this file. Also make sure everything that isn't code
# is commented in the file.  


# 1. Pseudocode

# What is the input?
# What is the output? (i.e. What should the code return?)
# What are the steps needed to solve the problem?


# 2. Initial Solution



convert integer.to_s

if integer.length<4
    no comma
if integer.length >= 4 and < 7
    one comma three over from last character (string[-3]?)
    string.split
    array.join
    
if integer.length >=7 and < 9
    two commas, three over from end (string[-3]? and six over from end(string[-6]?

returns one comma when integer between 1000 and 999999

return two commas when itneger between 1000000 and 999999999







# 3. Refactored Solution



# 4. Reflection 