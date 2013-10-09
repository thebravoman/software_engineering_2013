require 'time'
nachalo=0
krai=0
a=0

File.open(ARGV[0]).each do |line|
   if line =~ /-->/ && a==0
     nachalo=Time.parse(line.split(" --> ")[0])
     a+=1
   end
   if line =~ /-->/
     krai=Time.parse(line.split(" --> ")[1])
   end
end

krai=(krai-nachalo)*1000000000
puts krai.to_i
