# U2.W5: The Bakery Challenge (GPS 2.1)

# Your Names
# 1) Matthew Darin 
# 2) Hilary Barr 

 # This is the file you should end up editing. 
=begin
# Original code with comments/changes

def bakery_num(num_of_people, fav_food) #defining a method bakery_number.  Takes number of people and favorite food as parameters             
  my_list = {"pie" => 8, "cake" => 6, "cookie" => 1} #hash- my_list that has type of food as a key and amount of food as a value
  pie_qty = 0 # set default quantity to zero 
  cake_qty = 0 # set default quantity to zero 
  cookie_qty = 0 # set default quantity to zero 
  
  ##has_fave = false # setting has_fave to false ##

  #my_list.each_key do |k| # we are iterating over my_list key values 
    #if k == fav_food # if one of the keys matches fav_food, then...
      #has_fave = true # has_fave is set to true 
      ##fav_food = k ##not necessary  
    #closed out if statement 
 
    if my_list.has_key?(fav_food) #question mark goes infront of parens # if my_list has fav_food as a key..
        fav_food_qty = my_list.values_at(fav_food)[0] # fav_food quantity set equal to the value of fav_food
        if num_of_people % fav_food_qty == 0 # if num_people is evenly divisible by fav_food_quantity 
            num_of_food = num_of_people / fav_food_qty #num_food set equal to num_people divided by fav_food_qty
            return "You need to make #{num_of_food} #{fav_food}(s)." #
        else #num_of_people % fav_food_qty != 0 #redundant 
            while num_of_people > 0 # start of while statement 
                if num_of_people / my_list["pie"] > 0 # pie_quantity is now equal to the num_of_people divided by people in my_list
                    pie_qty = num_of_people / my_list["pie"] #pie_qty is now equal to 
                    num_of_people = num_of_people % my_list["pie"] #remainder left 
                elsif num_of_people / my_list["cake"] > 0   
                    cake_qty = num_of_people / my_list["cake"] 
                    num_of_people = num_of_people % my_list["cake"]
                else
                    cookie_qty = num_of_people
                    num_of_people = 0
                end
                return "You need to make #{pie_qty} pie(s), #{cake_qty} cake(s), and #{cookie_qty} cookie(s)."
            end  
         end 
        else #has_fave == false # if fav_food is not a key then has_fave = false #redundant - not needed 
            raise ArgumentError.new("You can't make that food") # raise argument using a string 
        end
    end

_______________________________________________________________________________________________________________

# Refactored Code   v 1 with while loop and case block

if my_list.has_key?(fav_food) 
        fav_food_qty = my_list.values_at(fav_food)[0] 
        if num_of_people % fav_food_qty == 0 
            num_of_food = num_of_people / fav_food_qty 
            return "You need to make #{num_of_food} #{fav_food}(s)." 
        else
            
            case fav_food
            when "pie"
                pie_qty = num_of_people / my_list[fav_food]
            when "cake"
                cake_qty = num_of_people / my_list[fav_food]
            when "cookie"
                cookie_qty = num_of_people / my_list[fav_food]
            end
            
            num_of_people = num_of_people % my_list[fav_food]
            
            while num_of_people > 0 
                if num_of_people / my_list["pie"] > 0 
                    pie_qty = num_of_people / my_list["pie"] 
                    num_of_people = num_of_people % my_list["pie"] 
                end
                if num_of_people / my_list["cake"] > 0   
                    cake_qty = num_of_people / my_list["cake"] 
                    num_of_people = num_of_people % my_list["cake"]
                end
                if num_of_people / my_list["cookie"] > 0 
                    cookie_qty = num_of_people
                    num_of_people = 0
                end
            end
            return "You need to make #{pie_qty} pie(s), #{cake_qty} cake(s), and #{cookie_qty} cookie(s)."
        end  

    else 
        raise ArgumentError.new("You can't make that food") # raise argument using a string 
       end
    end
=end 
     

# Refactored v. 2
# Note: the code will not pass unless we remove "and" from the test code 

def bakery_num(num_of_people, fav_food) 
  my_list = {"pie" => 8, "cake" => 6, "cookie" => 1} 
 
 
    if my_list.has_key?(fav_food) 
          fav_food_qty = my_list[fav_food]
        if num_of_people % fav_food_qty == 0 
            num_of_food = num_of_people / fav_food_qty 
            return "You need to make #{num_of_food} #{fav_food}(s)." 
        else 
            updated_list = {} # rename this to something more sensible
            updated_list[fav_food] = num_of_people / my_list[fav_food]
            num_of_people = num_of_people % my_list[fav_food]
            
          
           my_list.each_key do |food|
            updated_list[food] = num_of_people / my_list[food] unless updated_list[food] 
            num_of_people = num_of_people % my_list[food]
           end

           #return "You need to make #{updated_list["pie"]} pie(s), #{updated_list["cake"]} cake(s), and #{updated_list["cookie"]} cookie(s)."
            str = "You need to make "
            updated_list.each do |k,v|
                str += "#{k} #{v}(s), "
            end
            return str
          end 

     else 
            raise ArgumentError.new("You can't make that food") # raise argument using a string 
        end
    end   





        
#-----------------------------------------------------------------------------------------------------
#DRIVER CODE-- DO NOT MODIFY ANYTHING BELOW THIS LINE (except in the section at the bottom)
# These are the tests to ensure it's working. 
# These should all print true if the method is working properly.
p bakery_num(24, "cake") == "You need to make 4 cake(s)."
p bakery_num(41, "pie") == "You need to make 5 pie(s), 0 cake(s), and 1 cookie(s)."
p bakery_num(24, "cookie") == "You need to make 24 cookie(s)."
p bakery_num(4, "pie") == "You need to make 0 pie(s), 0 cake(s), and 4 cookie(s)."
p bakery_num(130, "pie") == "You need to make 16 pie(s), 0 cake(s), and 2 cookie(s)."
p bakery_num(41, "cake") == "You need to make 0 pie(s), 6 cake(s), and 5 cookie(s)." # WHAAAAAT? I thought I said I wanted cake!
p bakery_num(3, "apples") # this will raise an ArgumentError


=begin
#Reflection

What parts of your strategy worked? What problems did you face? What questions did you have while coding? What resources did you find to help you answer them? What concepts are you having trouble with, or did you just figure something out? If so, what?
We weren't sure why our code wasn't passing, so we printed each example in the driver test code to see what it was outputting. We realized the
problem involved control flow. After playing around with the code, we found that writing all "if" statements let the code continue onto the next
statement, while if-else statements returned wherever the code passed true. We aren't sure why the while loop wasn't working, but using a case block
ended up working because we were able to specify the control flow depending on which food was the favorite. 

Did you learn any new skills or tricks?
I learned that you can move all the code to the beginning of the line with command-[. This helps if you want to redo your indenting.

How confident are you with each of the Learning Competencies?
I feel like I have a long way to go with learning how to refactor. The more methods and techniques we learn, the better we will get at refactoring. 
I also am not sure if this is the DRYest we can make the code, but getting it to work is a good first step.

Which parts of the challenge did you enjoy?
I enjoyed going through the legacy code line by line and seeing our understanding of the whole picture come together.

Which parts of the challenge did you find tedious?
I didn't find it tedious per se, but there was a lot of repetition in the code which I wasn't sure how to improve
until Mo taught me how to fix the control flow and incorporate an each iterator.

=end