sub_counter = 0
search = /-->/
f=File.open(ARGV[0])
f.each do |text| 
	if text=~search 
		sub_counter += 1
	end
end
puts "Sub number = : #{sub_counter}"

f.close