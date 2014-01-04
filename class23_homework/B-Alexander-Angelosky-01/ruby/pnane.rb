class Plane
	attr_accessor :currentRow
	attr_accessor :currentColumn
	attr_accessor :seatsOcupped
	
	def initialize 
		self.currentRow = 0
		self.currentColumn = 0
		self.seatsOcupped = Array.new(27)
		i = 0
		j = 0
		while i < 27
			j = 0
			self.seatsOcupped[i] = Array.new(6)
			while j < 6
				self.seatsOcupped[i][j] = 0
				j = j + 1
			end
			i = i + 1
		end
		#help_arr = []
		#i = 0
		#while i < 6
		#	help_arr.push false
		#	i = i + 1
		#end
		#i = 0
		#self.seatsOcupped = []
		#while i < 27
		#	self.seatsOcupped.push help_arr
		#	i = i + 1
		#end
	end
	
	def add_people people
		while people > 0 and !is_full
			self.seatsOcupped[self.currentRow][self.currentColumn] = 1
			people = people - 1
			self.currentColumn = self.currentColumn + 1
			if self.currentColumn > 5
				self.currentColumn = 0
				self.currentRow = self.currentRow + 1
			end
		end
	end
	
	def is_full
		if self.seatsOcupped[26][5] == 0 
			return false
		end
		return true
	end
	
	def print_seats
		self.seatsOcupped.each do |inner|
			i = 0
			inner.each do |n|
				if i == 3 
					print " "
				end
				print "#{n}"
				i = i + 1
			end
			puts
		end
	end
end

plane = Plane.new
addedPeople = 0
places = 27*6
plane.print_seats
while addedPeople < places
	people = rand(3)+1
	while people+addedPeople > places
		people = rand(3)+1
	end
	addedPeople = addedPeople + people
	c = STDIN.getc
	plane.add_people people
	puts "--------------"
	plane.print_seats
	puts "--------------"
end
