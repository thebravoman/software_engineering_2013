require_relative "group_of_passengers"

class PassengerPlane

	attr_accessor :capacity
	attr_accessor :sum
	attr_accessor :current_group

	def initialize
		self.capacity = Array.new(27) { Array.new(6, 0) }
		self.sum = 162
		self.current_group = GroupOfPassengers.new
	end

	def fill_plane
		self.current_group = GroupOfPassengers.new
		while self.sum > 0 
			puts "Press enter to add another group to the plane..."
			gets
			self.current_group.set_size
			arrange_seats self.current_group.size
			puts "Added group of #{self.current_group.size} people..."
		end
	end

	def arrange_seats group
		case group
		when 1 then
			add_one_person
		when 2 then
			add_two_people
		when 3 then
			add_three_people
		end
	end

	def add_one_person
		if self.sum - 1 >= 0
			for i in 0..self.capacity.length - 1
				for j in 0..self.capacity[0].length - 1
					if self.capacity[i][j] == 0
						self.capacity[i][j] = 1
						self.sum = self.sum - 1
						return
					end
				end
			end
		else
			puts "Plane is already full..."
		end
	end

	def add_two_people
		if self.sum - 2 >= 0
			for i in 0..self.capacity.length - 1
				for j in 0..self.capacity[0].length - 1
					case j
					when 0 then
						if self.capacity[i][j] == 0 && self.capacity[i][j + 1] == 0
                                                        self.capacity[i][j] = 2
                                                        self.capacity[i][j + 1] = 2
                                                        self.sum = self.sum - 2
                                                        return
                                                end
					when 1 then
						if self.capacity[i][j] == 0 && self.capacity[i][j + 1] == 0
                                                        self.capacity[i][j] = 2
                                                        self.capacity[i][j + 1] = 2
                                                        self.sum = self.sum - 2
                                                        return
                                                end
					when 3 then
						if self.capacity[i][j] == 0 && self.capacity[i][j + 1] == 0
                                                        self.capacity[i][j] = 2
                                                        self.capacity[i][j + 1] = 2
                                                        self.sum = self.sum - 2
                                                        return
                                                end
					when 4 then
						if self.capacity[i][j] == 0 && self.capacity[i][j + 1] == 0
                                                        self.capacity[i][j] = 2
                                                        self.capacity[i][j + 1] = 2
                                                        self.sum = self.sum - 2
                                                        return
                                                end
					end
				end
			end
		else
			puts "Not enough seats for 2 more passengers..."
		end
	end

	def add_three_people
		if self.sum - 3 >= 0
			for i in 0..self.capacity.length - 1
				for j in 0..self.capacity[0].length - 1
					case j
					when 0 then
						if self.capacity[i][j] == 0 && self.capacity[i][j + 1] == 0 && self.capacity[i][j + 2] == 0
                                                        self.capacity[i][j] = 3
                                                        self.capacity[i][j + 1] = 3
                                                        self.capacity[i][j + 2] = 3
                                                        self.sum = self.sum - 3
                                                        return
                                                end
					when 3 then
						if self.capacity[i][j] == 0 && self.capacity[i][j + 1] == 0 && self.capacity[i][j + 2] == 0
                                                        self.capacity[i][j] = 3
                                                        self.capacity[i][j + 1] = 3
                                                        self.capacity[i][j + 2] = 3
                                                        self.sum = self.sum - 3
                                                        return
                                                end
					end
				end
			end
		else
			puts "Not enough seats for 3 more passengers..."
		end
	end

	def display_seats
		puts "Press enter to display seats..."
		gets
		for i in 0..self.capacity.length - 1
			for j in 0..self.capacity[0].length - 1
				print self.capacity[i][j]
			end
			puts
		end
	end
					
end

