require "MonkeyGenerator"

class Plane
	currentSeat = 0

	def initialize(rows, seatsPerRow)
		@seats = Array.new(rows) { Array.new(seatsPerRow, 0) }
	end

	def prepare()
		puts "Monkeys prepare..."
		findSeats()
	end

	def print()
		puts "Monkeys are ready."
		for row in 0..@seats.length-1 
			for seat in 0..@seats[row].length-1
				print @seats[row][seat]
				if (seat == 2)
					print " | "
				end
				if(seat == @seats[row].length-1)
					puts ""
				end
			end	
		end
	end

	def findSeats()
		group = MonkeyGenerator.new()
		peopleInGroup = 0
		seatsLeft = 0

		for row in 0..@seats.length-1
			currentSeat = 0
			seatsLeft = @seats[row].length / 2
			colomn = 1

			while(colomn < 3)
				if(currentSeat == 6) 
					break
				end
				
				peopleInGroup = group.generate(seatsLeft)
				print peopleInGroup
				puts " monkeys are coming. Press any key to find seats for them..."
				seatsLeft = fillSeats(peopleInGroup, row)

				if(seatsLeft == 0)
					seatsLeft = 3
					colomn += 1
				end
			end
		end
	end

	def fillSeats(people, row)
		fullSeats = @currentSeat
		
		for seat in 0..people-1
			if(@currentSeat == 6)
				return 0
			end
			
			@seats[row][@currentSeat.to_i] = people
			fullSeats = fullSeats + 1
			@currentSeat += 1
		end

		if(currentSeat > 2) 
			fullSeats -= 3		
		end

		return (@seats[row].length / 2) - fullSeats
	end


end
