=begin

# U2.W5: Class Warfare, Validate a Credit Card Number


# I worked on this challenge [with: Jonathan Young].


# 3. Initial Solution

=begin
# Refactored Solution

class CreditCard
  
  def initialize(card_number)
    if card_number.to_s.length == 16
        @card_number=card_number.to_s.split("")
    else 
      raise ArgumentError.new("Must enter 16 numbers")
    end
  end
  
  def even_total
      even_index_array = @card_number.select.each_with_index { |num, i| i.even? }
      even_times_two = even_index_array.map {|x| x.to_i*2}
      even_times_two = even_times_two.map! do |x| 
        if x > 9 
            x.to_s.split("")
        else
        	x.to_s
        end
    end
    even_times_two_flat = even_times_two.flatten.map! {|x| x.to_i }
    return even_times_two_flat.inject(:+)
  end
  
  def odd_total
    odd_index_array = @card_number.select.each_with_index { |num, i| i.odd? } 
    odd_index_array_integers = odd_index_array.map! {|x| x.to_i}
    return odd_index_array_integers.inject(:+)
  end
  
  def check_card
     @total = even_total + odd_total
    if @total % 10 == 0 
      return true
    else 
      return false
  	end
  end

end # Ends class




# 1. DRIVER TESTS GO BELOW THIS LINE

card1 = CreditCard.new(4563960122001999)
p card1.check_card==true 
p card1.even_total == 35
p card2.odd_total != 35 # => false


# Should raise argument error
card2 = CreditCard.new(456396012200199)
p card2.check_card


=end


# Refactored Solution


class CreditCard
  
  def initialize(card_number)
    if card_number.to_s.length == 16
        @card_number=card_number.to_s.split("").map!{|x| x.to_i}
    else 
      raise ArgumentError.new("Must enter 16 numbers")
    end
  end
  
  def check_card
     @card_number.each_index do |x|
        @card_number[x] =  @card_number[x] * 2 if x % 2 == 0
     end
     @card_number = @card_number.join("").chars.map { |x| x.to_i }
     total= @card_number.inject(:+) 
    if total % 10==0
      return true
    else
      return false
    end
  end
end


card1 = CreditCard.new(4563960122001999)
p card1.check_card==true
card2 = CreditCard.new(45639601999)
p card2.check_card==false






=begin
# 5. Reflection 

What parts of your strategy worked? What problems did you face? What questions did you have while coding? What resources did you find to help you answer them? What concepts are you having trouble with, or did you just figure something out? If so, what?
This was a difficult challenge with many steps, and breaking the challenge down step by step helped.
We weren't sure what our method names should be at first, so we figured this out through
trial and error. We also were initially confused about how to get our methods to talk to one another
and ended up figuring this out through trial and error. We also knew what we wanted our code to do (i.e.
only iterate over even or odd-indexed elements) but weren't sure what methods would make this possible and ended up finding answers by consulting Ruby Doc and Stack Overflow. 


Did you learn any new skills or tricks?
I learned a simpler way to write the .inject method (with a :+). We knew we wanted to act upon only
even-index and then odd-index items in the array, and ended up discovering the each_with_index.
We also wanted to condense the nested even arrays into one array and learned about .flatten (used in the original
version). After learning about each_index and .chars, we were able to simplify the code even more (in refactored version).
I also realized during this challenge that I need to test my code in IRB more since testing 
step-by-step helped us. 


How confident are you with each of the Learning Competencies?
I feel pretty comfortable with iterating through data strucutres, manipulating data within
data structures, and decomposing a problem into smaller, easier to solve components. Learning
how to read Ruby Doc has helped immensely with this.

Which parts of the challenge did you enjoy?
I felt that this was possibly the most difficult challenge we've had so far, and I enjoyed how good
it felt to complete it successfully. 

Which parts of the challenge did you find tedious?
I didn't find any parts of the challenge tedious.

=end



