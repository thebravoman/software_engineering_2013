require 'time'
begt=0
endt=0
s=0

File.open(ARGV[0]).each do |line|
	if line =~ /-->/ && s==0
		begt=Time.parse(line.split(" --> ")[0])
		s+=1
	end
	if line =~ /-->/
		endt=Time.parse(line.split(" --> ")[1])
	end
end

endt=(endt-begt)*1000000000
puts endt.to_i
