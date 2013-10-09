require 'time'
line1=0
line2=0

bool=false
res=0

File.open(ARGV[0]).each do |line|
    if line=~ /-->/
        if bool==false
	    line1=line
	    line1=Time.parse(line1.split("-->")[0])
	    bool=true
	end

    line2=line
    line2=Time.parse(line2.split("-->")[1])
    end
end

res=line2-line1
printf "%.0f",res*1000000000















