require_relative "Plane.rb"
require_relative "HumanGenerator.rb"

plane=Plane.new
generator=Human_Generator.new

people=0
group=0
plane.write_seats
while people<162
	group=generator.generate_humans
	if plane.fill_seats(group) == true
		plane.write_seats
		poeple+=group
	end
end
