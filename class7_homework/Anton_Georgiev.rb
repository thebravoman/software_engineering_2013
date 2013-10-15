require 'time'
subs = String.new
sub_control=String.new
second_time=Time.parse("20:20:20")
j = 0
i = 0

File.open(ARGV[0]).each do |line|
	if line =~ /-->/
		first_time=Time.parse(line.split(" --> ")[0])
		if second_time - first_time>=3 && j!=0
			sub_control="\n"
		end
		second_time=Time.parse(line.split(" --> ")[1])
		j=1
		i=0
	elsif i==1
		subs += line + sub_control
	end
	i+=1
end

File.open("#{ARGV[0].chomp(".srt")}_result.txt","w") do |file|
	file.write(subs)
end
