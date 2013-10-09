lines = []

srt = File.open(ARGV[0])
srt.each do |line|
	if line =~ (/\d\d:[0-5][0-9]:[0-5][0-9],\d\d\d/ ) 
		lines << line
	end
end

first = lines[0].split(/[,:]/)
second = lines[-1].split(/[,;]/)

hi = first[0].to_i*3600000 + first[1].to_i*60000 + first[2].to_i*1000 + first[3].to_i 
die = second[0].to_i*3600000 + second[1].to_i*60000 + second[2].to_i*1000 + second[3].to_i 
p (die-hi)*1000000
