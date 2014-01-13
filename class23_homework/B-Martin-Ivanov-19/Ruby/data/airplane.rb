require_relative "random_group_creator.rb"

class Airplane

	attr_accessor :capacity
	attr_accessor :sum
	attr_accessor :current_group

	def initialize
		@capacity = Array.new(27) {Array.new(6, 0)}
		@sum = 6*27
		@current_group = RandomGroupCreator.new
	end

	def fill_plane
		@current_group = RandomGroupCreator.new
		while @sum > 0 
			puts "Press enter to see the next group."
			gets
			@current_group.set_size
			arrange_seats @current_group.size
			puts "Added group of #{self.current_group.size} people."
		end
	end

	def arrange_seats group
		if group == 1 
			add_one_person
		elsif group == 2 
			add_two_people
		elsif group == 3 
			add_three_people
		else
			puts 'problem occures'
		end
	end

	def add_one_person
		if @sum - 1 >= 0
			for row in 0..@capacity.length - 1
				for seat in 0..@capacity[0].length - 1
					if @capacity[row][seat] == 0
						@capacity[row][seat] = 1
						@sum -= 1
						return
					end
				end
			end
		else
			puts "There arent any free seats !!! Wait for the next plane !!!"
		end
	end

	def add_two_people
		if @sum - 2 >= 0
			for row in 0..@capacity.length - 1
				for seat in 0..@capacity[0].length - 1
  					if seat == 0 || seat == 1 || seat == 3 || seat == 4
						if @capacity[row][seat] == 0 && @capacity[row][seat + 1] == 0
                            @capacity[row][seat] = 2
                            @capacity[row][seat + 1] = 2
                            @sum -= 2
                            return
                        end
					end	
				end
			end
		else
			puts "There arent any seats for couples !!! Wait for the next plane !!!"
		end
	end

	def add_three_people
		if @sum - 3 >= 0
			for row in 0..@capacity.length - 1
				for seat in 0..@capacity[0].length - 1
					if seat == 0 || seat == 3
						if @capacity[row][seat] == 0 && @capacity[row][seat + 1] == 0 && @capacity[row][seat + 2] == 0
                            @capacity[row][seat] = 3
                            @capacity[row][seat + 1] = 3
							@capacity[row][seat + 2] = 3
                            @sum -= 3
                            return
                        end
					end
				end
			end
		else
			puts "There arent any free seats for three people !!! Plese wait for the next plane"
		end
	end

	def display_seats
		puts "Press enter to display seats..."
		gets
		for row in 0..@capacity.length - 1
			for seat in 0..@capacity[0].length - 1
				print @capacity[row][seat]
			end
			puts
		end
	end
					
end
