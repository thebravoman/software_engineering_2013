require 'time'
bsub=0
esub=0
line1=0
line2=0
raz=0
sub=0
sline=0

File.open(ARGV[0]).each do |line|
	if line=~ /-->/
													#	bsub=line.split("-->")[0]
													#	esub=line.strip("-->")[1]		
			line1=line
			line1=Time.parse(line1.split("-->")[0])
													#line1=(line1.split("-->")[0])
													# line2=(line1.split("-->")[0])
        	line2=line
			line2=Time.parse(line2.split("-->")[1])  
			raz=line2-line1

			puts line2
			puts line1
			puts raz
	
				if raz>3
					sline=line.split(" --> ")[2]
					#sub=line
				end
	end
end

puts raz
puts sline


#File.open("36_results.txt","w") do |line|
#	file.write(sline)
#end


