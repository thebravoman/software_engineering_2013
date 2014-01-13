require_relative "data/airplane.rb"

 
while 1 

	puts "Enter yes/no for arranging new plane"
	choice = gets.chomp

	case choice 
		when 'yes'	
			plane = Airplane.new

			plane.fill_plane
			plane.display_seats
		when 'no'
			break
	end
end


