require 'benchmark'

class Game 

	attr_reader :doors, :chosen_door_number, :opened_door_number, :car_door_number, :switch_door_number

	def initialize
		@doors = []
		@chosen_door_number = nil
		@opened_door_number = nil
		@car_door_number = nil
		@switch_door_number = nil
		@prizes = ["goat", "car", "goat"]
		@prizes.shuffle!
		self.generate_doors
	end

	def generate_doors
		for door_number in 0..2 do 
			door = Door.new(@prizes.pop)
			@car_door_number = door_number if door.prize == "car"
			self.doors << door
		end
		self.choose_door
		self.open_door
		self.switch_door
	end

	def choose_door
		@chosen_door_number = rand(3)
	end

	def open_door
		possible_doors = [0, 1, 2]
		possible_doors.delete(@chosen_door_number)
		possible_doors.delete(@car_door_number)
		@opened_door_number = possible_doors.sample
	end

	def switch_door
		possible_doors = [0, 1, 2]
		possible_doors.delete(@chosen_door_number)
		possible_doors.delete(@opened_door_number)
		@switch_door_number = possible_doors[0]
	end

	def stay_win
		@chosen_door_number == @car_door_number
	end

	def swap_win
		@switch_door_number == @car_door_number
	end

end 

class Door

	attr_reader :prize

	def initialize(prize)
		@prize = prize
	end

end

# g = Game.new
# puts "CHOSEN DOOR -------------"
# p g.chosen_door_number
# puts "OPEN DOOR -------------"
# p g.opened_door_number
# puts "CAR DOOR -------------"
# p g.car_door_number
# puts "SWITCH DOOR -------------"
# p g.switch_door_number

games = 10_000
stay = 0
swap = 0
# games.times do
#   g = Game.new
#   stay += 1 if g.stay_win
#   swap += 1 if g.swap_win
# end

# stay_percentage = (((stay.to_f / games) * 100).to_i)
# swap_percentage = (((swap.to_f / games) * 100).to_i)

# puts "Staying works #{stay_percentage}% of the time."
# puts "Swapping works #{swap_percentage}% of the time."


# Benchmark.bm do |x|
#   x.report { 
#   games.times do
# 	  g = Game.new
# 	  stay += 1 if g.stay_win
# 	  swap += 1 if g.swap_win
# 	end }
#   x.report { g = Game.new}
# end

