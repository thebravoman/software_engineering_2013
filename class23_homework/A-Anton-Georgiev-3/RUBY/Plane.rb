class Plane
	attr_accessor :seats
	
	def initialize
		self.seats = Array.new(54) {Array.new(3)}
	end
	
	def write_seats
		i=0
		while i<54
			write i
			print " "
			write i+1
			print "\n"
		end
	end
	
	def fill_seats(passengers)
		54.times do |i|
			if passengers==3
				if seats[i][0]==0 && seats[i][1]==0 && seats[i][2]==0
					seats[i][0]=1
					seats[i][1]=1
					seats[i][2]=1
					return true
				end
			elsif passengers==2
				if seats[i][0]==0 && seats[i][1]==0
					seats[i][0]=1
					seats[i][1]=1
					return true
				elsif seats[i][1]==0 && seats[i][2]==0
					seats[i][1]=1
					seats[i][2]=1
					return true
				end
			elsif passengers==1
				if seats[i][0]==0
					seats[i][0]=1
					return true
				elsif seats[i][1]==0
					seats[i][1]=1
					return true
				elsif seats[i][2]==0
					seats[i][2]=1
					return true
				end
			else
				return false
			end
		end
	end
	
private
	def write(i)
		3.times do |j|
			print self.seats[i][j]
		end
	end
end
