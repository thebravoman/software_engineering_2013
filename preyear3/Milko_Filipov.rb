i = 0
s = /-->/
f=File.open(ARGV[0])
f.each do |line| 
	if line=~s 
		i += 1
	end
end
puts "Subtitle count = : #{i}"

f.close
