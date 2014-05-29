# U2.W6: Create a Playlist from Driver Code


# I worked on this challenge [by myself].


# Pseudocode
# Create class Song.
# Define initialize method that takes two parameters, title and artist.
# Define play method.

# Create class Playlist.
# Define intiialize method that takes unspecified (*) amount of songs as parameters.
# Define add method 
# Define num_of_tracks method
# Define play method
# Define remove method that takes one parameter, *song.
# Define includes? method that takes one parameter, *song.
# Define play_all method.


# Initial Solution/Refactored Solution: 




class Song 

	attr_reader :title, :artist

	def initialize(title, artist)
		@title=title
		@artist=artist
	end

	def play
		puts "Now playing #{@title} by #{@artist}"
	end

end



class Playlist 

	attr_reader: songlist

	def initialize(*songs)
		@songlist=[]
		songs.each {|song| @songlist << song }
	end


	def add(*songs)
		songs.each {|song| @songlist << song }
	end


	def remove(*songs)
		songs.each {|song| @songlist.delete(song)}
	end

	def num_of_tracks
		@songlist.length
	end

	def includes?(song)
		if @songlist.include?(song)
			true
		else
			false
		end
	end

	def play_all
		playlist=@songlist.shuffle
		puts ""
		playlist.each {|song| puts "Now playing " + song.title + " by " +  song.artist + ". "}
	end
	
	 def display
		puts ""
		print "This playlist includes:"
		@songlist.each {|song|  print song.title + " by " +  song.artist+ "/"}
	end

end




# DRIVER TESTS GO BELOW THIS LINE
one_by_one = Song.new("One by One", "Sirenia")
one_by_one.play

world_so_cold = Song.new("World So Cold", "Three Days Grace") 
going_under = Song.new("Going Under", "Evanescence")

my_playlist = Playlist.new(one_by_one, world_so_cold, going_under)
p my_playlist.includes?(one_by_one)==true
my_playlist.display
my_playlist.play_all
p my_playlist.num_of_tracks==3


lying_from_you = Song.new("Lying From You", "Linkin Park")
angels = Song.new("Angels", "Within Temptation")
my_playlist.add(lying_from_you, angels)
p my_playlist.includes?(angels)== true
p my_playlist.num_of_tracks == 5

my_playlist.remove(angels)
p my_playlist.num_of_tracks == 4
my_playlist.display
my_playlist.play_all

p my_playlist.includes?("nosong")==false    # Note: I could test a string here but not an object that wasn't set. So if I removed the quotation marks
                                            # from nosong, I'd get an argument error.





=begin
#Reflection

What parts of your strategy worked? What problems did you face? What questions did you have while coding? What resources did you find to help you answer them? What concepts are you having trouble with, or did you just figure something out? If so, what?

I got my code to work but couldn't figure out why all the components of the object were printing oddly (object looking like #String102020 
@title="Title @name="name"). By looking at the code for Challenge 2, I realized that as long as you include an object defined in another class
in a class (i.e. how the song objects are initialized as values for a new Playlist object), as well as use an attr_accessor method,
you can call the methods of the other class. So I was able to call song.title and song.artist inside the play_all and display methods of the 
Playlist class. 

When I tried to write a method for .includes?(song) that would equal false, i.e. p my_playlist.includes?(nosong)==false, I got an error message:
undefined local variable or method `nosong' for main:Object (NameError). I realized that I could test a string here but not an object that wasn't 
set. So if I removed the quotation marks from nosong, I'd get an argument error.


Did you learn any new skills or tricks?
I learned you can call a method in an instance method of one class that was defined in another class. I also became more familiar with 
*splat arguments.

How confident are you with each of the Learning Competencies?
I am confident about implementing a basic Ruby class and identifying when to use instance variables. I am confident about translating a
 user story into driver code and solutions. I am a little less confident about translating driver test code into a class structure using 
 object-oriented design because I am still not completely sure which methods can be turned into driver code.

Which parts of the challenge did you enjoy?
I enjoyed figuring out why my code was printing oddly by getting the epiphany that you can call methods defined in other classes if you
include an object of that class.

Which parts of the challenge did you find tedious?
I didn't find any parts of the challenge tedious.


=end


