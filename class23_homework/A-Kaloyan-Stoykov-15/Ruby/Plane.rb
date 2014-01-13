class Plane

	attr_accessor :seats
	attr_accessor :seatsTaken

	def initialize row, col
		@seats = Array.new(row) { Array.new(col, 0) }
		@seatsTaken = 0
	end

	def add (group)
		for row in 0...@seats.length
			for col in 0...@seats[0].length
				if((group.groupSize == 1) && (@seats[row][col] == 0))
					@seats[row][col] = 1
					
					taken = @seatsTaken
					@seatsTaken = taken + 1
					
					return
				elsif ((group.groupSize == 2) && (col != 2 && col != 5) && (@seats[row][col] == 0 && @seats[row][col + 1] == 0))
					@seats[row][col] = 2
					@seats[row][col + 1] = 2
					
					taken = @seatsTaken
					@seatsTaken = taken + 2
					
					return
				elsif ((group.groupSize == 3) && (col == 0 || col == 3) && (@seats[row][col] == 0 && @seats[row][col + 1] == 0 && @seats[row][col + 2] == 0)) 
					@seats[row][col] = 3
					@seats[row][col + 1] = 3
					@seats[row][col + 2] = 3
					
					taken = @seatsTaken
					@seatsTaken = taken + 3
					
					return
				end	
			end
		end
	end

	def printSeats
		i = 0
		j = 0
		for i in 0...@seats.length
			for j in 0...@seats[0].length
				print seats[i][j]
				if j == 2
					print " "
				end
			end
			puts
		end
		
	end
end