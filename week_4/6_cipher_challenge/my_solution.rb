# U2.W4: Cipher Challenge


# I worked on this challenge with: Michael Weiss 



# 1. Solution
# Write your comments on what each thing is doing. 
# If you have difficulty, go into IRB and play with the methods.


=begin
  

# Takes a string called coded_message then converts each character into a new element in an array
# Outputs decoded message as string

def north_korean_cipher(coded_message)
  input = coded_message.downcase.split("") # Converts coded_message string into array with each character as a new element
  decoded_sentence = [] # Initialize empty array
  =begin
  cipher = {"e" => "a",   # A hash isn't the most efficient way to automate this. We will create an array.
            "f" => "b",   
            "g" => "c", 
            "h" => "d", 
            "i" => "e", 
            "j" => "f",
            "k" => "g",
            "l" => "h",
            "m" => "i",
            "n" => "j",
            "o" => "k",
            "p" => "l",
            "q" => "m",
            "r" => "n",
            "s" => "o",
            "t" => "p",
            "u" => "q",
            "v" => "r",
            "w" => "s",
            "x" => "t",
            "y" => "u",
            "z" => "v",
            "a" => "w",
            "b" => "x",
            "c" => "y",
            "d" => "z"}
    =end
            
  cipher = ("a".."z").to_a.rotate(-4) # Defines an array that maps numbers to letters shifted by 4, so for example
                                    # 3 = d gets mapped to z
                            
             
  input.each do |x| # Each is determining if a char in input is in the cipher or the whitespace array
    found_match = false  # Why would this be assigned to false from the outset? What happens when it's true?
    cipher.each_key do |y| # This is looping through each key in the cipher array
      if x == y  # X is the character in the input. Y is the key value in the cipher. We want to find a match.
        #puts "I am comparing x and y. X is #{x} and Y is #{y}."
        decoded_sentence << cipher[y]
        found_match = true
        break  # Why is it breaking here?
      elsif ['@', '#', '$', '%', '^', '&', '*'].include?(x)
  
      #x == "@" || x == "#" || x == "$" || x == "%"|| x == "^" || x == "&"|| x =="*" #This is converting symbols to whitespace
        decoded_sentence << " "
        found_match = true
        break
      end
=begin               # We removed this because a number would be put in decoded_sentence anyway in following code
elsif (0..9).to_a.include?(x) # This checks if a character is a number and returns the number unchanged
        decoded_sentence << x
        found_match = true
        break
      end 

    end
    if not found_match  # What is this looking for?
      decoded_sentence << x
    end
  end
  decoded_sentence = decoded_sentence.join("")

   

  if decoded_sentence.match(/\d+/) #This looks for digits and includes ones that are repeated consecutively
    decoded_sentence.gsub!(/\d+/) { |num| num.to_i / 100 } #This divides numbers by 100
  end  


  return decoded_sentence # What is this returning?        
end


=end







# Your Refactored Solution


def north_korean_cipher(coded_message, cipher)
  input = coded_message.downcase.split("") # Converts coded_message string into array with each character as a new element
  decoded_sentence = [] # Initialize empty array

  alphabet = ("a".."z").to_a     # If we wanted to use a Hash we could have incorporated .rotate
  whitespace = ['@', '#', '$', '%', '^', '&', '*']
    
  input.each do |character| # Each is determining if a char in input is in the cipher or the whitespace array
    if alphabet.include?(character) 
        decoded_sentence << alphabet[(alphabet.index(character) - cipher) % 26] # Return the position of the letter four letters ahead
    elsif whitespace.include?(character)
        decoded_sentence << " "
    else  
        decoded_sentence << character
   end
  end
  
  decoded_sentence = decoded_sentence.join("")
  decoded_sentence.gsub!(/\d+/) { |num| num.to_i / 100 } #He's been known to exaggerate...
   
  return decoded_sentence # Returns the original message
end





# Driver Code:
p north_korean_cipher("m^aerx%e&gsoi!", 4) == "i want a coke!" #This is driver code and should print true
# Find out what Kim Jong Un is saying below and turn it into driver code as well. Driver Code statements should always return "true"
p north_korean_cipher("syv@tistpi$iex#xli*qswx*hipmgmsyw*erh*ryxvmxmsyw%jsshw^jvsq^syv#1000000#tvsjmxefpi$jevqw.", 4)=="our people eat the most delicious and nutritious foods from our 10000 profitable farms."
p north_korean_cipher("syv%ryoiw#evi#liph^xskixliv@fc^kveti-jpezsvih@xsjjii.*hsr'x%xipp&xli#yw!", 4)=="our nukes are held together by grape-flavored toffee. don't tell the us!"
p north_korean_cipher("mj^csy&qeoi^sri*qmwxeoi,%kir.*vm@csrk-kmp,&csy^ampp*fi&vitpegih*fc@hirrmw&vshqer.", 4)=="if you make one mistake, gen. ri yong-gil, you will be replaced by dennis rodman."
p north_korean_cipher("ribx^wxst:$wsyxl%osvie,$xlir$neter,#xlir%xli%asvph!", 4)=="next stop: south korea, then japan, then the world!"
p north_korean_cipher("ger^wsqifshc*nywx^kix^qi&10000*fekw@sj$gssp%vergl@hsvmxsw?", 4)=="can somebody just get me 100 bags of cool ranch doritos?"


=begin
# Reflection

What parts of your strategy worked? What problems did you face?
Our code didn't pass at first and we realized that it was because we wrote +4 in line 115 when we should have written -4.
That was because we misinterpreted how the cipher worked. We also had trouble figuring out how to write the cipher in array format
at first and ended up realizing that we could include the cipher as part of the method so that the amount the letters shift can
easily be changed without having to change what is in the method body. 

What questions did you have while coding? What resources did you find to help you answer them?
We had some questions about whether certain array, hash, and string methods existed and found answers by consulting Ruby Doc
and Stack Overflow. For example, we wanted to know if there was a way to indicate which index a character was at in an array,
and found that there is a .index method. We also answered some questions by using IRB, such as determining what string.split("") does
(it returns an array with each character as its own element).

What concepts are you having trouble with, or did you just figure something out? If so, what?
I misunderstood how modulo worked until Michael explained it to me. I also had trouble imagining how we could do this in any
way other than a hash at first, but Michael helped me understand how we could use arrays and why this was preferable. 

Did you learn any new skills or tricks?
Michael taught me a simpler way to open a file on sublime (typing tab when you start to type the name of a folder and writing the
entire path out rather than continuously writing cd). Michael also explained what modulo means and how we could use this
to ensure that the rotation works for every index.

How confident are you with each of the Learning Competencies?
I feel confident with the learning objectives and feel that doing this challenge in a pair programming session helped solidify
the learning objectives even more.

Which parts of the challenge did you enjoy?
I enjoyed seeing how much quicker and better we were able to refactor the code as a pair than if did this on our own. We learned a lot
from bouncing ideas off eachother.

Which parts of the challenge did you find tedious?
I didn't find any part tedious, but trying to figure out what was going on in the original code was a bit confusing at first.



=end
 