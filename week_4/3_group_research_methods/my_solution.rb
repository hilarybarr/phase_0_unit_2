# U2.W4: Research Methods




# Person 1's solution - Rootul

def my_array_finding_method(source, thing_to_find)
    return source.select {|v| v =~ /#{thing_to_find}/}
end

def my_hash_finding_method(source, thing_to_find)
    new_hash = source.select {|k,v| v == thing_to_find}  
    new_array = new_hash.to_a.flatten
    new_array.delete(thing_to_find)
    return new_array
end





# Person 2

i_want_pets = ["I", "want", 3, "pets", "but", "I", "only", "have", 2 ]
my_family_pets_ages = {"Evi" => 6, "Hoobie" => 3, "George" => 12, "Bogart" => 4, "Poly" => 4, 
  "Annabelle" => 0, "Ditto" => 3}



def my_array_modification_method(source, thing_to_modify)
  source.map {|element| element.is_a?(Integer)? element + thing_to_modify : element}
end


p my_array_modification_method(i_want_pets, 1)

p my_array_modification_method(i_want_pets, 1) == ["I", "want", 4, "pets", "but", "I", "only", "have", 3 ]




def my_hash_modification_method(source, thing_to_modify)
  newsource=Hash[source.map{|key, value| [key, value.is_a?(Integer)? value + thing_to_modify : value]}]
end


p my_hash_modification_method(my_family_pets_ages, 2) 

p my_hash_modification_method(my_family_pets_ages, 2) == {"Evi" => 8, "Hoobie" => 5, "George" => 14, "Bogart" => 6, "Poly" => 6, "Annabelle" => 2, "Ditto" => 5}


# Identify and describe the ruby method you implemented. 
# .map is the Ruby method I implemented. It returns a new array with the results of running the block once for every element in enumerator.
# This is different from array.each, which returns the original array. 
# I also used .is_a?(Integer) to specify whether an element or value is an integer.




# Person 3 - Alan

def my_array_sorting_method(source)
  # Convert each element in the array to a string, for comparison/sorting purposes
  for index in 0...source.length
    source[index] = source[index].to_s
  end

  sorted_array = source.sort_by do |element|
    element
  end

  return sorted_array
end

def my_hash_sorting_method(source)
  # Your code here!
  sorted_hash = source.sort_by do |key, value|
    value
  end

  return sorted_hash
end




# Person 4 - Cassie (myself)

def my_array_deletion_method(source, thing_to_delete)

  source.delete_if {|i| i.to_s.include?(thing_to_delete)}
  return source

end

def my_hash_deletion_method(source, thing_to_delete)
  
  source.delete_if {|k, v| v.to_s.include?(thing_to_delete)}
  return source

end


# I used the method delete_if, which seemed like the most 
# appropriate method for the task. delete_if deletes every
# element for the array or hash if the block evaluates to
# true, and changing the array or hash to reflect the deletion.  










=begin

# Person 4
def my_array_deletion_method(source, thing_to_delete)
  #Your code here!
end

def my_hash_deletion_method(source, thing_to_delete)
  #Your code here!
end

# Identify and describe the ruby method you implemented. 
# 
#
#

=end











 

=begin

MY ATTEMPT AT TEST 1: 

def my_array_finding_method(source, thing_to_find)
  sourcenew=source.map!{|x| x.to_s}
  sourcenew.select {|x| x.include?(thing_to_find)}
end

print my_array_finding_method(i_want_pets, "t") 
print my_array_finding_method(i_want_pets, "t") == ["want","pets","but"]




def my_hash_finding_method(source, thing_to_find)
  sourcenew=source.keep_if {|key, value| value==thing_to_find}
  return sourcenew.keys
end


print my_hash_finding_method(my_family_pets_ages, 3)

print my_hash_finding_method(my_family_pets_ages, 3) == ["Hoobie", "Ditto"]





MY ATTEMPT AT TEST 3:



i_want_pets = ["I", "want", 4, "pets", "but", "I", "only", "have", 3]
my_family_pets_ages={"Evi" => 8, "Hoobie" => 5, "George" => 14, "Bogart" => 6, "Poly" => 6, "Annabelle" => 2, "Ditto" => 5}



# Create a method that alphabetizes an array of integers and strings, with integers appearing first, followed by capital and then lowercase
# words. Each element will only appear once and each element will be in string form in alphabetized array.
def my_array_sorting_method(source)
  # Removes duplicates and converts every integer to a string.
  # Create new array as opposed to use source! because don't want to modify existing data structure
  source_2=source.uniq.map!{|x| x.to_s}
  # Sorts array in alphabetical order 
  source_2.sort{|a,b| a <=> b}
end

print my_array_sorting_method(i_want_pets) 

puts my_array_sorting_method(i_want_pets) == ["3", "4", "I", "but", "have", "only", "pets", "want"]



# Create a method that sorts a hash by age.
def my_hash_sorting_method(source)
 source.sort_by{|name, age| age}
end


print my_hash_sorting_method(my_family_pets_ages)

# This may be false depending on how your method deals with ordering the animals with the same ages.
puts my_hash_sorting_method(my_family_pets_ages) == [["Annabelle", 2], ["Ditto", 5], ["Hoobie", 5], ["Bogart", 6], ["Poly", 6], ["Evi", 8], ["George", 14]] 




=end



=begin
################## DRIVER CODE ###################################
# HINT: Use `puts` statements to see if you are altering the original structure with these methods. 
# Each of these should return `true` if they are implemented properly.

p my_array_finding_method(i_want_pets, "t") == ["want","pets","but"]
p my_hash_finding_method(my_family_pets_ages, 3) == ["Hoobie", "Ditto"]
p my_array_modification_method(i_want_pets, 1) == ["I", "want", 4, "pets", "but", "I", "only", "have", 3 ]
p my_hash_modification_method(my_family_pets_ages, 2) == {"Evi" => 8, "Hoobie" => 5, "George" => 14, "Bogart" => 6, "Poly" => 6, "Annabelle" => 2, "Ditto" => 5}
p my_array_sorting_method(i_want_pets) == ["3", "4", "I", "but", "have", "only", "pets", "want"]
p my_hash_sorting_method(my_family_pets_ages) == [["Annabelle", 2], ["Ditto", 5], ["Hoobie", 5], ["Bogart", 6], ["Poly", 6], ["Evi", 8], ["George", 14]] 
# This may be false depending on how your method deals with ordering the animals with the same ages.
p my_array_deletion_method(i_want_pets, "a") == ["I", 4, "pets", "but", "I", "only", 3 ]
p my_hash_deletion_method(my_family_pets_ages, "George") == {"Evi" => 8, "Hoobie" => 5, "Bogart" => 6, "Poly" => 6, "Annabelle" => 2, "Ditto" => 5}
=end


=begin
Reflect!

I learned a lot in this lesson. My driver code initially wasn't passing. When I deleted the driver test code, my code did what I wanted it to, but when I 
added the driver test code, it printed two versions of each array and hash and registered as "false". Attending a tutoring session with Dominic, I 
learned that this was because I had "print source" in my method when I should have just printed the method call (which would have returned the 
mapped source) and driver test code. Also, I learned that having a bang after source.map was contributing to two different copies of the data
structure being printed in this case.

I also learned that there is a difference between p, print, and puts. Puts and print call to_s on an object (with puts adding a newline).  
p calls the inspect method, making it better for debugging since you see your code in the data type its written in.﻿

Dominic also taught me how to use subl from terminal to make it easier to open files.

I asked Dominic whether code should be adapted to fit a test or a test should be adapted to fit a code that seems to be working but isn't passing,
and he told me that code should be adapted to fit a test. This was important to understand early on.

In addition, I learned about some new methods (in particular, map and is_a) and became better acquainted with the Ruby specification. I learned that
Enumerable methods apply to both arrays and hashes.



=end
