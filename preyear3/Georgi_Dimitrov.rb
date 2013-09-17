File.open(ARGV[0])
br = 0
File.readlines(ARGV[0]).each do |line|
 if line =~ /-->/
 br += 1
 end
end
 puts br