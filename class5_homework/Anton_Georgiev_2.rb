require 'time'
first_time=0
last_time=0
j=0

File.open(ARGV[0]).each do |line|
   if line =~ /-->/ && j==0
     first_time=Time.parse(line.split(" --> ")[0])
     j+=1
   end
   if line =~ /-->/
     last_time=Time.parse(line.split(" --> ")[1])
   end
end

last_time=(last_time-first_time)*1000000000
puts last_time.to_i
