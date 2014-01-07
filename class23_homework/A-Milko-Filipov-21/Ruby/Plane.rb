require_relative "Messages"

class Plane < Messages
	def initialize rows, seatsPerRow 
		@seats = Array.new(rows) { Array.new(seatsPerRow , 0) }
		@takenSeats = 0
		@takenRows = 0
		@rows = rows
		@numberOfGroups = 0;
		@seatsRemaining = rows*seatsPerRow
	end
		
	def fillSeats
		search randomer
		increaseNumOfGroups
		printSeats			
	end
		
	private
	
	def search group
		check
		@freeSeats = 0
		@seats[@takenRows].each {|e| @freeSeats += 1 if e == 0}
		increaseTakenRows
		puts
		groupMsg @numberOfGroups,group
		puts
		gets
		noFreeSpaceCheck group
		@seats.each_with_index do |row,r|
			row.each_with_index do |seat,s|
				if group == 1 && checkForOne(r,s)
					fillOne r,s
					modify group
					return
				elsif group == 2 && checkForTwo(r,s)
					fillTwo r,s
					modify group
					return
				elsif group == 3 && checkForThree(r,s)	
					fillThree r,s
					modify group
					return
				end
			end
		end
	end
	
	def increaseTakenRows
		@takenRows += 1 if @freeSeats == 0
	end
		
	
	def printSeats
		for element in @seats do
            puts element.to_s.gsub(',',"").gsub('[',"").gsub(']',"").insert(@seats[0].length, "                ")
        end
    end
	
	def check
		if @takenRows == @rows
			exitMsg
			exit
		end
	end
	
	def checkForOne row,seat
		return @seats[row][seat] == 0
	end	
	def fillOne row,seat
		@seats[row][seat] = 1
	end
	
	def checkForTwo row,seat
		return @seats[row][seat] == 0 && @seats[row][seat+1] == 0 && seat != 2 && seat !=5
	end
	def fillTwo row,seat
		@seats[row][seat] = 2
		@seats[row][seat+1] = 2
	end
	
	def checkForThree  row,seat
		return  @seats[row][seat] == 0 && @seats[row][seat+1] == 0 && @seats[row][seat+2] == 0 && (seat == 0 || seat == 3)
	end
	def fillThree row,seat
		@seats[row][seat] = 3
		@seats[row][seat+1] = 3
		@seats[row][seat+2] = 3
	end
	 
	def noFreeSpaceCheck group
		noSpace group if group > @seatsRemaining
	end
	
	def modify num
		@freeSeats -= num
		@takenSeats += num
		@seatsRemaining -= num
	end

	def increaseNumOfGroups
		@numberOfGroups += 1;
	end
	
	def	randomer
		(1 + rand(3))
	end
end