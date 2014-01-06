require_relative 'plane'
require_relative 'random_in_range'
require_relative 'people/group'
require_relative 'people/passenger'

rnd = RandomInRange.new 1,3
group = Group.new
pesho = Plane.new 27,6
boarded = 0

pesho.print_seats_plan

while(boarded<6*27) do
	gets
	rn = rnd.generate
	rn.times do
		group.add_member Passenger.new
	end
	
	if(pesho.add_group group)
		pesho.print_seats_plan
		boarded +=rn
	end
	group.clear
end

