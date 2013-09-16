i=0
file=File.open(ARGV[0])
file.each do |line|
if line =~/-->/
i+=1
end
end
puts i
