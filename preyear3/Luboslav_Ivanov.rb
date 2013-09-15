lines = 0
s = /-->/
file = File.open(ARGV[0]).each do |line|
	if line =~ s
    lines += 1
	end
end

file.close
puts "#{lines} lines of subtitles"
