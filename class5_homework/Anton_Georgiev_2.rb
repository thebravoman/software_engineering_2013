require 'time'
first_time=0
last_time=0
j=0

File.open(ARGV[0]).each do |line|
   if line =~ /-->/ && j==0
     first_time=line.split(" --> ")[0]
     first_time=Time.parse(first_time)
     j+=1
   end
   if line =~ /-->/
     last_time=line.split(" --> ")[1]
     last_time=Time.parse(last_time)
   end
end

last_time=(last_time-first_time)*1000000000
puts last_time.to_i
