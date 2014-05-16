# U2.W4: Refactor Cipher Solution


# I worked on this challenge [by myself ].


# 1. Solution
# Write your comments on what each thing is doing. 
# If you have difficulty, go into IRB and play with the methods.
# Also make sure each step is necessary. If you don't think it's necessary
# Try implementing the code without it. 

def translate_to_cipher(sentence)        
    alphabet = ('a'..'z').to_a   # Creates an array with every letter in the alphabet as its own element
    cipher = Hash[alphabet.zip(alphabet.rotate(4))]   # Creates a hash called cipher with the alphabet array as the keys and 
                                                       #the alphabet array rotated 4 as the values (so a=e, w=a, etc)
    spaces = ["@", "#", "$", "%", "^", "&", "*"]
    
    original_sentence = sentence.downcase #Converts every character in the sentence to downcase so it can be compared with our cipher
    encoded_sentence = [] # Creates empty array encoded_sentence where each character will go after being encrypted
    original_sentence.each_char do |element|   # Iterates through each character of the sentence string
      if cipher.include?(element) # If the cipher includes the character as a value, the key is pushed to the encoded_sentence array
        encoded_sentence << cipher[element]
      elsif element == ' '        # If the character is whitespace, a random element in the spaces array is pushed to the encoded_sentence array
        encoded_sentence << spaces.sample
      else 
        encoded_sentence << element # If a character is not a letter or whitespace, it is pushed to the encoded_sentence array as is
      end
     end
    
    return encoded_sentence.join  # All the characters in the encoded_sentence array are joined to form a string
end



=begin
# Questions:
# 1. What is the .to_a method doing?: 
 The .to_a method is turning a range of characters into an array where each character becomes its own element.

# 2. How does the rotate method work? What does it work on? 
The rotate method returns a new array by rotating an array such that the element at the specified amount of spaces over (the parameter) becomes 
the first element of the new array. 

# 3. What is `each_char` doing?: 
Each_char specifies that the block will iterate over every character in the string.

# 4. What does `sample` do? 
Sample selects a random element in an array.

# 5. Are there any other methods you want to understand better?
I wanted to understand the .zip method so I researched it in Ruby Doc and found that it merges two arrays such that one array is the values and one 
is the keys.

# 6. Does this code look better or worse than your refactored solution? 
This code looks more concise than my refactored solution because of the use of a hash rather than arrays for the cipher.

# 7. Is this good code? What makes it good? What makes it bad?
This is good code because 

=end

# 1. DRIVER TESTS GO BELOW THIS LINE
# Does this return the same thing every time?
p translate_to_cipher("I want cookies")
p translate_to_cipher("I want cookies")
p translate_to_cipher("I want cookies")
p translate_to_cipher("I want cookies")




=begin
# 5. Reflection 

What parts of your strategy worked? What problems did you face?
Using Ruby Doc to elucidate what different methods meant helped me understand this code. I couldn't think of any code that could be
removed, but am wondering if I was right.

What questions did you have while coding? What resources did you find to help you answer them?
I wasn't sure what many of the methods in the code meant so I consulted Ruby Doc and Stack Overflow to understand them.

What concepts are you having trouble with, or did you just figure something out? If so, what?
I figured out that writing basic encryption software isn't as difficult as I thought it would be.

Did you learn any new skills or tricks?
I learned some new methods, including zip, rotate, each_char, and sample.

How confident are you with each of the Learning Competencies?
I feel pretty confident with each of the learning objectives, but feel I will become better at refactoring code the more methods I learn.

Which parts of the challenge did you enjoy?
I enjoyed learning about the rotate and zip methods because they would have made our refactored code in Challenge 6 much simpler.

Which parts of the challenge did you find tedious?
I didn't find any parts of the challenge tedious.
=end

