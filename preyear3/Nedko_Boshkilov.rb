i=1
while line = gets
	if line.to_i == i
		i+=1
	end
end
puts i-1