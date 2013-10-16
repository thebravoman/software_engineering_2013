require 'time'
sub=String.new
i=0

File.open(ARGV[0]).each do |line|
	if line =~ /-->/
		i=0	
		line1=Time.parse(line.split("-->")[0])
		line2=Time.parse(line.split("-->")[1])
		
	elsif  i==1
		sub=sub+line
	end

 i=i+1
end

File.open("sub.txt","w") do |txt|
	txt << sub
end