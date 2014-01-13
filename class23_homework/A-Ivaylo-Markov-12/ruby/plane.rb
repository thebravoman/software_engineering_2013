class Plane
	
	def initialize rows,cols
		@left_seats = Array.new(rows){Array.new(cols/2)}
		@right_seats = Array.new(rows){Array.new(cols/2)}
		@availiable_row = 0
		@availiable_col = 0
		@availiable = false
	end
	
	def fly
		print "PIKIRAM"
	end
	
	def print_seats_plan
		puts "Left seats:"
		print_seats @left_seats
		puts "Right seats:"
		print_seats @right_seats
	end

	def add_group group
		seatedLeft = true
		find_empty_seats @left_seats, group.get_size
		if(!@availiable)
			seatedLeft = false
			find_empty_seats @right_seats, group.get_size
			if(!@availiable) then
				puts "Can't accommodate group of #{group.get_size}"
				return false 
			end
		end
		if(seatedLeft)
			seat_group group, @left_seats
			return true
		end
		seat_group group, @right_seats
		return true
	end

	private
	
	def print_seats seats
		seats.each_index do |row|
			seats[row].each_index do |col|
				print "[ ]" if(seats[row][col] == nil)
				print "[O]" if (seats[row][col] != nil)
			end
			puts ""
		end
	end
	
	def seat_group group, seats
		i = 0
		while (i<group.get_size) do
			seats[@availiable_row][@availiable_col] = group.get_member i
			@availiable_col +=1
			i+=1
		end
		@availiable = false
		puts "Group of #{group.get_size} accommodated."
	end
	
	def find_empty_seats seats, amount
		@availiable = false
		if(amount == 1) then
			seats.each_index do |row|
				seats[row].each_index do |col|
					if(seats[row][col] == nil) then
						@availiable = true
						@availiable_col = col
						@availiable_row = row
					end
				end
			end
		end
		
		if(amount == 2) then
			seats.each_index do |row|
				if((seats[row][0] == nil) && (seats[row][1] == nil)) then
						@availiable = true
						@availiable_col = 0
						@availiable_row = row
				end
				if((seats[row][1] == nil) && (seats[row][2] == nil)) then
						@availiable = true
						@availiable_col = 1
						@availiable_row = row
				end
			end
		end
		
		if(amount == 3) then
			seats.each_index do |row|
				if((seats[row][0] == nil) && (seats[row][1] == nil) && (seats[row][2] == nil)) then
					@availiable = true
					@availiable_col = 0
					@availiable_row = row
				end
			end
		end
		
	end
	
end

