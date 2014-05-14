# U2.W4: Homework Cheater!


# I worked on this challenge [by myself ].


=begin
# User Stories

As a user, I want to

Create a generic template
Use the generic template (without overwriting it)
Input a title into the template
Identify and pass in a person/place/topic into the template
Input an important date into the template
Input my thesis statement into the template
Output my finished template onto the screen
 


# 2. Pseudocode

Create a method called essay_writer that takes the following parameters: title, author, teachername, topic, topictype, date, thesis_statement, and gender.

Create a generic template inside the method and set it to a variable.
 
Identify three topics and store the generic version of your three topics in variables for the sake of testing.
 
Pass the input into the generic template.
 
Output the finished template.


 

# 3. Initial Solution


def essay_writer(title, author, teachername, topic, topictype, date, thesis_statement, gender)
   print "\n#{title} by #{author}\n"
   print "Submitted at #{Time.now}\n"
   print "(See #{teachername}, I got this in before midnight. Don't I deserve extra credit for that?)"
    
    
   print "\nReady to read the best paper of all time, #{teachername}? You know, the kind of paper that deserves an A++. Well here goes." 
    
  
       if topictype=="person"
            print "#\n{topic} was an important #{topictype} in #{date}."
            if gender.downcase=="male"
              print "He was so important that I am writing this paper about him.\n\nHis most important contribution was that he #{thesis_statement}. \n\n#{topic} really did a lot. Aww yeah!"
            else
              print "She was so important that I am writing this paper about her. \n\nHer most important contribution was that she #{thesis_statement}. \n\n #{topic}really did a lot. Aww yeah!"
            end
      elsif topictype=="place"
            print "\n#{topic} was an important #{topictype} in #{date}. This place was so important that I am writing this paper about it. The most interesting thing that happened there was that #{thesis_statement}. \n\n#{topic} would have been my dream vacation spot if I could go back to #{date}. Aww yeah!"
      elsif topictype=="thing"
            print "\n#{topic} were an important #{topictype} in #{date}. They were so important that I am writing this paper about them. The most interesting thing about them were #{thesis_statement}. \n\n#{topic} were such a cool thing. Aww yeah!"
      else
            print "invalid topictype"
     end

        
end

  

=end

# 4. Refactored Solution
# Added case block to simplify code. Removed print statements. Added variables.


def essay_writer(title, author, teachername, topic, topictype, date, thesis_statement, gender)
    sentence1="\n#{title} by #{author}\n\nReady to read the best paper of all time, #{teachername}? You know, the kind of paper that deserves an A++. Well here goes." 
    sentence2="\n#{topic} was an important #{topictype} in #{date}."
    sentence3="He was so important that I am writing this paper about him. His most important contribution was that he #{thesis_statement}. \n#{topic} really did a lot. Aww yeah!"
    sentence4="She was so important that I am writing this paper about her. Her most important contribution was that she #{thesis_statement}. \n#{topic}really did a lot. Aww yeah!"
    sentence5="#{topic} was an important #{topictype} in #{date}. This place was so important that I am writing this paper about it. \nThe most interesting thing that happened there was that #{thesis_statement}. \n#{topic} would have been my dream vacation spot if I could go back to #{date}. Aww yeah!"
    sentence6="#{topic} were an important #{topictype} in #{date}. They were so important that I am writing this paper about them. \nThe most interesting thing about them were #{thesis_statement}. \n#{topic} were such a cool thing. Aww yeah!"
    case topictype
       when "person"
            if gender.downcase=="male"
              sentence1 + sentence2 + sentence3
            else
              sentence1 + sentence2+ sentence4
            end
      when "place"
            sentence1 + sentence5
      when "thing"
              sentence1 + sentence6 
      else
            "invalid topictype"
     end      
end



# Person
print essay_writer("Tom Hanks the Stud", "Hilary Barr", "Mrs. Jones", "Tom Hanks", "person", 1993, "was in so many movies that you can't forget him! He is the best actor" ,"male")

# Place
print essay_writer("La France de la Revolution", "Hilary Barr", "Mrs. Jones", "Revolutionary France", "place", 1790, "French citizens overthrew the monarchy and fought for Enlightenment-inspired ideals, particularly the concepts of popular sovereignty and inalienable rights.", 0)

# Thing
print essay_writer("The History of Dragons", "Hilary Barr", "Mrs. Jones", "Dragons", "thing", 1205, "they inspired countless legends and myths all over the world.", 0)




# 1. DRIVER TESTS GO BELOW THIS LINE
# HINT: Use `puts` statements to see if you are altering the original structure with these methods.
# Each of these should return `true` if they are implemented properly.


paragraph1="\nTom Hanks the Stud by Hilary Barr\n\nReady to read the best paper of all time, Mrs. Jones? You know, the kind of paper that deserves an A++. Well here goes.\nTom Hanks was an important person in 1993.He was so important that I am writing this paper about him. His most important contribution was that he was in so many movies that you can't forget him! He is the best actor. \nTom Hanks really did a lot. Aww yeah!"

paragraph2="\nLa France de la Revolution by Hilary Barr\n\nReady to read the best paper of all time, Mrs. Jones? You know, the kind of paper that deserves an A++. Well here goes.Revolutionary France was an important place in 1790. This place was so important that I am writing this paper about it. \nThe most interesting thing that happened there was that French citizens overthrew the monarchy and fought for Enlightenment-inspired ideals, particularly the concepts of popular sovereignty and inalienable rights.. \nRevolutionary France would have been my dream vacation spot if I could go back to 1790. Aww yeah!"

paragraph3="\nThe History of Dragons by Hilary Barr\n\nReady to read the best paper of all time, Mrs. Jones? You know, the kind of paper that deserves an A++. Well here goes.Dragons were an important thing in 1205. They were so important that I am writing this paper about them. \nThe most interesting thing about them were they inspired countless legends and myths all over the world.. \nDragons were such a cool thing. Aww yeah!"





p essay_writer("Tom Hanks the Stud", "Hilary Barr", "Mrs. Jones", "Tom Hanks", "person", 1993, "was in so many movies that you can't forget him! He is the best actor","male")== paragraph1

p essay_writer("La France de la Revolution", "Hilary Barr", "Mrs. Jones", "Revolutionary France", "place", 1790, "French citizens overthrew the monarchy and fought for Enlightenment-inspired ideals, particularly the concepts of popular sovereignty and inalienable rights.", 0)== paragraph2

p essay_writer("The History of Dragons", "Hilary Barr", "Mrs. Jones", "Dragons", "thing", 1205, "they inspired countless legends and myths all over the world.", 0)== paragraph3






=begin
# 5. Reflection 


What parts of your strategy worked? What problems did you face? What questions did you have while coding? What resources did you find to help you answer them?
I couldn't figure out why my code was working but the tests weren't passing, so I had a tutoring session and learned that I needed to set my strings to variables.
I also learned that the driver test code needed to match exactly what the output would be (i.e. there needed to be the right number of newline characters). Using a 
code block was a nice way to organize the code.

What concepts are you having trouble with, or did you just figure something out? If so, what?
I wanted to include the time submitted (Time.new) but wasn't sure how to get this passed by the test code. I also wanted to produce different output depending
on if a thing ended in an "s." I will keep playing with this until I figure it out. I also am not sure if my pseudocode was well-written; I have
a better understanding of how to do what I wanted than of how to describe it.

Did you learn any new skills or tricks?
I learned about the differences between print, put, and p (discussed more in depth in my Challenge 3 reflection). In this challenge, I was able to use either print
or p when calling my method but print returned the method in proper form (i.e. with newlines).

How confident are you with each of the Learning Competencies?
I feel confident with each of the learning competencies. This challenge especially reinforced my understanding of producting methods that take input and 
produce a certain output and how to write driver test code.

Which parts of the challenge did you enjoy?
Seeing all my tests pass was the best part of the challenge :-D

Which parts of the challenge did you find tedious?
Writing different text for a person, place, and thing was a bit tedious but necessary.
=end







