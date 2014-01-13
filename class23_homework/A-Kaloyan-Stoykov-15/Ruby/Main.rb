require_relative "Group"
require_relative "Plane"

row = 27
col = 6
plane = Plane.new(row, col)

while plane.seatsTaken != row * col
	currentGroup = Group.new
	puts plane.seatsTaken

	if plane.seatsTaken > row * col
		plane.seatsTaken(plane.seatsTaken - currentGroup.groupSize)
		puts "We were enable to find seats for group of " + currentGroup.groupSize + " members. Wainting for the next group"
	else
		puts "We are about to place #{currentGroup.groupSize} persons. Proceed?"
		gets
		plane.add(currentGroup)
		plane.printSeats
	end
end