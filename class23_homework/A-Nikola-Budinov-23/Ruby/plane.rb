
class Plane

	def initialize(row, seatsPerRow)
		@seats = Array.new(row) { Array.new(seatsPerRow, 0) }
		@freeseats = 0
		@freerows = 0
		@gr = 0
		@row = row
		@busyseats = 0
	end

	def filler
	looker randomer
	end	

	def putNoPlace
	puts "No free place in the plane"
	exit
	end	

	def checker(freeseats)
		if @freerows == @row 
			putNoPlace
		elsif @freerows == @row-1
			if freeseats < @gr
				putNoPlace
			else
				looker 1
			end
		end
	end

def looker gr
	@gr = gr
	freeseats = 0
	
	@seats[@freerows].each do |seat|
		freeseats+=1 if seat == 0
	end

	press
	puts "Group of-#{@gr} : "
		 puts
	@gr.times do
			if freeseats > 0
				freeseats-=1
				@seats[@freerows][freeseats] = 1
				@busyseats+=1
			else
				@freerows+=1
				freeseats = 6
				freeseats-=1
				@seats[@freerows][freeseats] = 1
				@busyseats+=1
			end
			puts "Passenger #{@busyseats} took place #{freeseats+1} on row #{@freerows+1} "
			checker freeseats		
		end

		displaySeats
	end

	def displaySeats
	c = 0
		@seats.each do |row|
			c = 0
			row.each do |seat| 
				if c<3
					print " #{seat}"
					c+=1
				else 
				print "      #{seat}"
				c=1
				end
			end
		puts
		end
	end


	def press
		puts "Press Enter"
		gets
	end
	
	def randomer
		(1 + rand(3))
	end
end

plane = Plane.new 27,6
100.times {plane.filler}
