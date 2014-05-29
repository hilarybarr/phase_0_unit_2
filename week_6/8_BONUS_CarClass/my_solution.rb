# U2.W6: Create a Car Class from User Stories


# I worked on this challenge [by myself ].


# 2. Pseudocode

=begin

Create class Car.
Initialize car object with model and color parameters, and with @speed set to 0 and @traveled set to 0.
Create drive method that takes miles as parameter and adds miles to @traveled and puts how many miles you drive.
Define accelerate_to method that takes mph as parameter, then sets @speed to mph and returns @speed.
Define decelerate_to method that takes mph as parameter, then sets @speed to mph and returns @speed.
Define turn_right method that outputs string declaring that you turned right.
Define turn_left method that outputs string declaring that you turned left.
Define stop method that resets speed to 0 and outputs string declaring that you stopped.

Attributes:
Model
Color
Speed
Traveled (distance traveled)


Methods:
Drive
Accelerate_to
Decelerate_to
Stop
TurnRight
TurnLeft


=end
# 3. Initial Solution
# The only thing different in my original solution was that I had methods that returned traveled and speed, but in my refactored
# code I removed the methods and just kept them in attr_reader so I could make driver tests for them.



# 4. Refactored Solution

class Car

	attr_reader :model, :color, :traveled, :speed
	
	def initialize(model, color)
		@model=model
		@color=color
		@speed=0
		@traveled=0
	end

	def drive (miles)
		@traveled += miles
		puts "You drive #{miles} miles."
	end

	def accelerate_to (mph)
	 	@speed = mph
	 	puts "Accelerate to speed limit of #{@speed} mph."
	end

	def decelerate_to (mph)
		@speed = mph
		puts "Slow down to speed limit of #{@speed} mph."
	end

	def turn_right
		puts "At the stop sign, turn right."
	end

	def turn_left
		puts "At the stop sign, turn left."
	end

	def stop
		@speed=0
		puts "You have stopped at your destination."
	end

end




# 1. DRIVER TESTS GO BELOW THIS LINE

ford=Car.new("ford", "black")
p ford.color=="black"
p ford.model=="ford"
ford.accelerate_to(25)
p ford.speed==25
ford.drive(0.25)
ford.turn_right
ford.accelerate_to(35)
ford.drive(1.50)
p ford.speed == 35
ford.decelerate_to(15)
ford.drive(0.25)
ford.turn_left
ford.drive(1.40)
ford.accelerate_to(35)
ford.stop
p ford.speed==0
p ford.traveled== 3.4






# 5. Reflection 

=begin
This was such a fun challenge! 	I enjoyed modeling a real-world video game. I wasn't sure how to write driver tests for this
until I realized that setting traveled and speed as attr_reader methods but not as instance methods would enable me to write
driver tests for them. I would like to return to this and do Release 3 and Release 4 after reading POODR.

=end