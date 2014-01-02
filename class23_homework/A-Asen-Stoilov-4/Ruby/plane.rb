class Plane 
	attr_accessor :seats
	attr_accessor :freeseats
	attr_accessor :seatcount
	attr_accessor :freecount
	
	def initialize
		self.freecount = 26*6
		self.seatcount = 0
		self.seats =  Array.new(26) { Array.new(6, 0) }
		self.freeseats = Array.new(26)
		(0..25).each do |i|
			self.freeseats[i] = 6
		end
	end
	
	def getPlaneReady
	
		while self.freecount > 0
		
			puts 'press the enter key'
			names = gets

			if names == "\n"
				addGroup
				printseats
				puts self.freecount
			end
		end
	end
	
	private
	
	def findseat count,size
		free = 0
		if freeseats[count] < 6
			free = 6 - freeseats[count] 
		end
		(free..(free+size-1)).each do |i|
			puts "<Pasenger seated ROW:#{count+1} SEAT:#{i+1}>\n"
			seats[count][i] = 1
			self.freecount -=1	
		end
	end
	
	def addGroup
		
		grsize = 1 + rand(3)
		(seatcount..25).each do |i|
			if freeseats[i] >= grsize 
				findseat i,grsize
				freeseats[i] -=grsize
				break 		
			elsif i==25
				puts "<Pasengers can't be seated>"
			end
			
		end
		
		if freeseats[seatcount] == 0
				self.seatcount +=1
			end	
	end
	
	def  printseats
		(0..25).each do |i|
			(0..5).each do |j|
				if seats[i][j] == 1
					puts "<ROW:#{i+1}|SEAT:#{j+1} - OCCUPIED>\n"
				else
					puts "<ROW:#{i+1}|SEAT:#{j+1} - FREE>\n"
				end
			end
		end
	end
end

plane = Plane.new
plane.getPlaneReady
