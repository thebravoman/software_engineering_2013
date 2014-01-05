require_relative "Group"

class Plane
	def initialize rows, seats_per_row, after_which_seat_is_the_walkway
		@seats = Array.new(rows+1) { Array.new(seats_per_row+1, 0) } # Creating array and filling it with 0. 0 means a seat is empty
		@num_of_rows = rows
		@num_of_seats_per_row = seats_per_row
		@after_which_seat_is_the_walkway = after_which_seat_is_the_walkway
		@empty_seats = rows * seats_per_row
	end
	
	def fly_plane
		puts "Flying away..."
	end
	
	def fill_plane
		while @empty_seats > 0
			add_group_to_plane
		end
		puts "Plane is full!"
	end
	
	def add_group_to_plane
		new_group = Group.new
		puts "Ceated group of #{new_group.get_people_in_group}"
		find_seats new_group
	end
	
	def find_seats new_group
		if new_group.get_people_in_group == 1
			add_one_person
		elsif new_group.get_people_in_group == 2 && @empty_seats >= 2
			add_two_people
		elsif new_group.get_people_in_group == 3 && @empty_seats >= 3
			add_three_people
		else
			puts "Not enough seats!"
		end
	end
	
	def add_one_person
		@seats.each_index do |row|
			next if row == 0 # Skiping the 0 row
			@seats[row].each_index do |seat|
				next if seat == 0 # Skiping the 0 seat
				if @seats[row][seat] == 0
					puts "New passenger on row = #{row}, seat = #{seat}"
					@seats[row][seat] = 1
					@empty_seats -= 1
					return
				end
			end
		end
	end
	
	def add_two_people
		@seats.each_index do |row|
			next if row == 0 # Skiping the 0 row
			@seats[row].each_index do |seat|
				next if seat == 0 # Skiping the 0 seat
				if @seats[row][seat] == 0 && @seats[row][seat+1] == 0
					if seat != @after_which_seat_is_the_walkway && seat+1 != @after_which_seat_is_the_walkway+1
						@seats[row][seat] = 2
						@seats[row][seat+1] = 2
						puts "Passenger 2 seat is row = #{row}, seat = #{seat}"
						puts "Passenger 2's friend's seat is row = #{row}, seat = #{seat+1}"
						@empty_seats -= 2
						return
					end
				end
			end
		end
	end
	
	def add_three_people
		@seats.each_index do |row|
			next if row == 0 # Skiping the 0 row
			@seats[row].each_index do |seat|
				next if seat == 0 # Skiping the 0 seat
				if @seats[row][seat] == 0 && @seats[row][seat+1] == 0 && @seats[row][seat+2] == 0
					if seat != @after_which_seat_is_the_walkway && seat+1 != @after_which_seat_is_the_walkway+1 && seat+2 != @after_which_seat_is_the_walkway+2 # checks if:  3 | 3 3
					if seat+1 != @after_which_seat_is_the_walkway && seat+2 != @after_which_seat_is_the_walkway+1 # checks if:  3 3 | 3
						@seats[row][seat] = 3
						@seats[row][seat+1] = 3
						@seats[row][seat+2] = 3
						puts "Passenger 3 seat is row = #{row}, seat = #{seat}"
						puts "Passenger 3's friend's seat is row = #{row}, seat = #{seat+1}"
						puts "Passenger 3's other friend's seat is row = #{row}, seat = #{seat+2}"
						@empty_seats -= 3
						return
					end
					end
				end
			end
		end
	end

	def print_all_seats
		@seats.each_index do |row|
			next if row == 0 # Skiping the 0 row
			@seats[row].each_index do |seat|
				next if seat == 0 # Skiping the 0 seat
				print "  #{@seats[row][seat]}"
			end
			puts
		end
	end
	
end