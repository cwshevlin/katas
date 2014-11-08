class Game 

	def initialize
		@doors = []
		@chosen_door_number = nil
		@prizes = ["goat", "car", "goat"]
		@prizes.shuffle
		self.generate_doors
	end

	def generate_doors
		3.times do 
			self.doors << Door.new(@prizes.pop)
		end
	end

	def choose_door
		@chosen_door_number = rand(3)
	end

end 

class Door

	def initialize(prize)
		@prize = prize
	end

end