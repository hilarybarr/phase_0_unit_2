# U2.W4: Research Methods




=begin
# Person 1's solution
def my_array_finding_method(source, thing_to_find)
  # Your code here!
end

def my_hash_finding_method(source, thing_to_find)
  # Your code here!
end

# Identify and describe the ruby method you implemented. 
# 
#
#

# Person 2
def my_array_modification_method(source, thing_to_modify)
  # Your code here!
end

def my_hash_modification_method(source, thing_to_modify)
  # Your code here!
end

# Identify and describe the ruby method you implemented. 
# 
#
#

=end




i_want_pets = ["I", "want", 4, "pets", "but", "I", "only", "have", 3]
my_family_pets_ages={"Evi" => 8, "Hoobie" => 5, "George" => 14, "Bogart" => 6, "Poly" => 6, "Annabelle" => 2, "Ditto" => 5}


# Person 3

# Create a method that alphabetizes an array of integers and strings, with integers appearing first, followed by capital and then lowercase
# words. Each element will only appear once and each element will be in string form in alphabetized array.
def my_array_sorting_method(source)
  # Removes duplicates and converts every integer to a string.
  # Create new array  as opposed to use source! because don't want to modify existing data structure
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




# Identify and describe the ruby method you implemented. 
# array.uniq: removes duplicate elements
# array.map: returns a new array with the results of running the block once for every element in enum. 
#            (Similar to .each, except each returns original object)
# .to_s: converts integers to strings
# array.sort {|a,b| a<=>b}: sorts in alphabetical order
# hash.sort_by {|a,b| b}: sorts by value in ascending order



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

# Reflect!
# 
# Learned difference .collect (a method of enumerable) and .length
# 
# 
# 

=end