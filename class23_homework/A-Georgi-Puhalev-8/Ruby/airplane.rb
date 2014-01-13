number_of_rows = 27
number_of_seats = 3
row1 = Array.new(number_of_rows) { Array.new(number_of_seats) }
row2 = Array.new(number_of_rows) { Array.new(number_of_seats) }
empty_seats = number_of_rows*number_of_seats*2
check = true
i = 0


puts "Welcome to PuhAir! For a new plane press enter"

while empty_seats > 0 do
	gets
	
	r = Random.new.rand(1..3)
	if r == 1	
		puts "1 passenger incoming"
	else
		puts "A group of #{r} passengers incoming"
	end
	
	(0...number_of_rows).each do |co|
		case r
			when 1
				(0...number_of_seats).each do |i|
					check = true
					if row1[co][i] == nil
						row1[co][i] = r
						check = false
						break
					elsif row2[co][i] == nil
						row2[co][i] = r
						check = false
						break
					end
				end
			when 2
				(0...number_of_seats-1).each do |i|
					check = true
					if row1[co][i] == nil && row1[co][i+1] == nil
						row1[co][i] = r
						row1[co][i+1] = r
						check = false
						break
					elsif row2[co][i] == nil && row2[co][i+1] == nil
						row2[co][i] = r
						row2[co][i+1] = r
						check = false
						break
					end
				end
			when 3
				(0...number_of_seats-2).each do |i|
					check = true
					if row1[co][i] == nil && row1[co][i+1] == nil && row1[co][i+2] == nil
						row1[co][i] = r
						row1[co][i+1] = r
						row1[co][i+2] = r
						check = false
						break
					elsif row2[co][i] == nil && row2[co][i+1] == nil && row2[co][i+2] == nil
						row2[co][i] = r
						row2[co][i+1] = r
						row2[co][i+2] = r
						check = false
						break
					end
				end
		end
		if check == false
			if r == 1
				puts "1 passenger successfully seated!"
			else
				puts "#{r} passengers successfully seated!"
			end
			empty_seats = empty_seats - r
			break
		end
	end
	
	if check == true
		if r == 1
			puts "We're sorry, but we have no room for you on this plane. Please, try another flight."
		else
			puts "We're sorry, but we have no room for your group on this plane. Please, try another flight."
		end
	end
	
	puts "Remaining empty seats:  #{empty_seats}"
end


gets

p "Here is the destribution of the passengers:"
(0...number_of_rows).each do |co|
	print "| "
	(0...number_of_seats).each do |i|
		print "#{row1[co][i]}"
	end
	print " "
	(0...number_of_seats).each do |i|
		print "#{row2[co][i]}"
	end
	print " |"
	puts
end























