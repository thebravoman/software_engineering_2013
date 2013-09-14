counter = 0
f = File.new(ARGV[0], "r")
begin
	while true do
		line = f.readline
		next if !(line =~ /^\d+$/)
		line = f.readline
		next if !(line =~ /-->/)
		counter += 1
	end
rescue EOFError
	f.close
end
puts counter