if File.exists?(ARGV[0])
count=0
File.readlines(ARGV[0]).each do |line|
if line =~ /-->/ 
count += 1
end
end
puts count
end
