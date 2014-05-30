# U2.W6: Refactoring for Code Readability


# I worked on this challenge [by myself, with: ].


# Original Solution
    else 
      raise ArgumentError.new("Must enter 16 numbers")
    end
  end
  
  def even_total
      even_index_array = @card_number.select.each_with_index { |num, i| i.even? }
      even_times_two = even_index_array.map {|x| x.to_i*2}
      even_times_two = even_times_two.map! do |x| 




# Refactored Solution






# DRIVER TESTS GO BELOW THIS LINE






# Reflection 