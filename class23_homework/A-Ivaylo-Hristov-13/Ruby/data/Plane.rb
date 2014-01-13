require_relative "MessageScreen"
require_relative "Group"

class Plane < MessageScreen
	def initialize(rows, seatsPerRow)
		@seats = Array.new(rows) { Array.new(seatsPerRow, 0) }
		@emptySeats = rows * seatsPerRow
	end
	
	def fly
		while @emptySeats > 0
			newGroup = Group.new
			
			if newGroup.members == 1
				@message = "*** #{newGroup.members} new passenger is looking for a seat"
			else
				@message = "*** #{newGroup.members} new passengers are looking for seats"
			end
				
			printMessage
			addPassengers(newGroup)
			printSeats
			printMessage
		end
		
		@message = "*** The plane is full. Please put on your seat belts! ***"
		printMessage
	end
	
	private
	def addPassengers(group)
		@message = "*** Passengers successfully seated! ***"
		
		findSeats group.members
	end
	
	def printSeats
		for element in @seats do
			puts element.to_s.gsub(',',"").gsub('[',"").gsub(']',"").insert(@seats[0].length, "		")
		end
		gets
	end
	
	def findSeats passengers
		for row in 0...@seats.length
			for seat in 0...@seats[0].length
				if passengers == 1 && roomForOne?(row, seat)
					@seats[row][seat] = 1
					@emptySeats -= 1
					return nil
				elsif passengers == 2 && roomForTwo?(row, seat)
					@seats[row][seat] = 2
					@seats[row][seat+1] = 2
					@emptySeats -= 2
					return nil
				elsif passengers == 3 && roomForThree?(row, seat)
					@seats[row][seat] = 3
					@seats[row][seat+1] = 3
					@seats[row][seat+2] = 3
					@emptySeats -= 3
					return nil
				end
			end
		end
		
		@message = "*** The passengers didn't find seats and will wait for the next flight. ***"
	end
	
	def roomForOne?(row, seat)
		return @seats[row][seat] == 0
	end
	
	def roomForTwo?(row, seat)
		return roomForOne?(row, seat) && seat < @seats[0].length - 1 && seat != @seats[0].length / 2 - 1 && @seats[row][seat+1] == 0
	end
	
	def roomForThree?(row, seat)
		return roomForTwo?(row, seat) && seat < @seats[0].length - 2 && (seat < @seats[0].length / 2 - 2 || seat >= @seats[0].length / 2) && @seats[row][seat+2] == 0
	end
end