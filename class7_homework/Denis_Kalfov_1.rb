require 'time'
sub=Array.new(0)
line1=Array.new(0)
line2=Array.new(0)
i=0

File.open(ARGV[0]).each do |line|
	if line =~ /-->/
		i=0	
		line1 << Time.parse(line.split("-->")[0])
		line2 << Time.parse(line.split("-->")[1])
		
	elsif  i==1
		sub << line
	end

i=i+1
end

i=0

File.open("Denis_Kalfov.txt","w+") do |txt|
	while i!=line1.length() do
		
		if (line1[i+1].to_f)-(line2[i].to_f)>=3
			txt << sub[i].chomp
      	    		txt << "\n"
     	    		i=i+1
     	        else
     	        	txt << sub[i].chomp
     	   		i=i+1
		end	
	end
end

