require 'time'
subs = String.new
sub_plus=String.new
time_two=Time.parse("00:00:00")
j = 0
i = 0


File.open(ARGV[0]).each do |line|
	if line =~ /-->/
		time_one=Time.parse(line.split(" --> ")[0])
		if time+two - time_two>=3 && j!=0
			sub_plus="\n"
		end
		time_two=Time.parse(line.split(" --> ")[1])
		j=1
		i=0
	elsif i==1
		subs += line + sub_plus
	end
	i+=1
end


File.open("#{ARGV[0].chomp(".srt")}_result.txt","w") do |file|
	file.write(subs)
end