# U2.W6: Refactoring for Code Readability


# I worked on this challenge [with Jonathan Young].


# Original code
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









# Refactored Solution


class CreditCard
  
  def initialize(card_number)
    if card_number.to_s.length == 16
        @card_number=card_number.to_s.split("").map!(&:to_i)
    else 
      raise ArgumentError.new("Must enter 16 numbers")
    end
  end
  
  def check_card
     @card_number.each_index do |x| # [1,2,3,4]
        @card_number[x] =  @card_number[x] * 2 if x % 2 == 0
        #@card_number[0]= 1 * 2  if 0 %2==0  ---> 1--> 2
        #@card_number[1]= 2 * 2 if 1 %2==0  --> 2-->2
     end
     @card_number = @card_number.join("").chars.map { |x| x.to_i }
   # Chars creates an array of strings with each character as separate element
   # [2,2,6,4].inject
     total= @card_number.inject(:+) 
    if total % 10==0
      return true
    else
      return false
    end
  end
end


def assert
  raise "Assertion failed!" unless yield
end

card1 = CreditCard.new(4563960122001999)
assert {card1.checkcard==true} # nothing happens
assert {card1.instance_variable_get(:@card_number)==4563960122001999} # nothing happens

card2 = CreditCard.new(45639601999)
assert {card2.check_card==true} # Will return "Assertion failed!"

# Reflection 

=begin
	
The key to our refactoring was the .each_index and .char methods. .Each_index let us consolidate what we did to our even and odd indices
into one method. We found it really helpful to write out what was happening line-by-line. This especially helped us keep track of what 
format our output was in (i.e. array, string, etc). As a result, we knew when we needed to use .to_s, .to_i, or .char, etc. We also realized
the even_total and odd_total methods weren't necessary since they weren't relevant to the point of the program. We thus only needed an initialize
and check_card method. 

I learned that .char turns every character in a string into an element in an array. I also learned about .each_index, in which
case whats in the || refers to the index.  

I enjoyed going through this in a pair because we were able to learn more in a shorter amount of time than we would on our own.

=end  
	
end