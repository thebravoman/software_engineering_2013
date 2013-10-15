require 'time'


masiv=[]
time=0
time1=0
time2=0

File.foreach(ARGV[0]) do |line|


	if line =~ /-->/
	time1=Time.parse(line.split(" --> ")[1])
	
	end
	if line =~ /-->/
	time2=Time.parse(line.split(" --> ")[0])
	time=time2-time1
	
	end
	p time

end
