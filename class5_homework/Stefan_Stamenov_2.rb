require 'time'
start=0
dif=0
finish=0
counter=0

File.open(ARGV[0]).each do |line|
    if line =~ /-->/ && counter==0
	  #if the counter is 0 that means that this is the first subtitle
      start=Time.parse(line.split(" --> ")[0])
	  counter=1
      #no matter what number is the counter,because it is != 0,so it's not the firs sub 
	end
    if line =~ /-->/
     finish=Time.parse(line.split(" --> ")[1])
    end
end

dif=(finish-start)*1000000000
puts dif.to_i
