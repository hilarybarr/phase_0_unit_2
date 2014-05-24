=begin

# U2.W5: Class Warfare, Validate a Credit Card Number


# I worked on this challenge [with: Jonathan Young].


# 3. Initial Solution


class CreditCard

def initialize(card_number)
     if card_number.to_s.length == 16
        @card_number=card_number
    else 
        raise ArgumentError.new("Must enter 16 numbers")
end

def check_card
end
  
    

# 1. Starting with the second to last digit, double every other digit until you reach the first digit

card_num_array = @card_number.to_a
# For testing with irb: card_num_array=["4", "5", "6", "3", "9", "6", "0", "1", "2", "2", "0", "0", "1", "9", "9", "9"]
odd_index_array = card_num_array.select.each_with_index { |num, i| i.odd? }
  # will return new array with odd index numbers
even_index_array=card_num_array.select.each_with_index { |num, i| i.even? }
  # will return new array with even index numbers

even_times_two = even_index_array.map {|x| x.to_i*2}

even_times_two.map! do |x| 
    if x > 9 
        x.to_s.split("")
    else
    	x.to_s
    end
end

odd_index_array_integers = odd_index_array.map! {|x| x.to_i}
odd_total=odd_index_array_integers.inject(:+)

even_times_two_flat = even_times_two.flatten
even_times_two_flat.map! {|x| x.to_i }
even_total = even_times_two_flat.inject(:+)

total = even_total + odd_total
p total


if total % 10 ==0 
    return true
else 
    return false
end

=end


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



=begin
# 5. Reflection 

What parts of your strategy worked? What problems did you face?


What questions did you have while coding? What resources did you find to help you answer them?


What concepts are you having trouble with, or did you just figure something out? If so, what?


Did you learn any new skills or tricks?


How confident are you with each of the Learning Competencies?


Which parts of the challenge did you enjoy?


Which parts of the challenge did you find tedious?

=end



