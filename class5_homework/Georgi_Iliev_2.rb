require 'time'

s= /-->/
sub_first=0
sub_last=0


i=0

File.open(ARGV[0]).each do |line|
   if line =~ s && i==0
     sub_first=Time.parse(line.split("-->")[0])
     i+=1
   end
   if line =~ s
     sub_last=Time.parse(line.split("-->")[1])
   end
end

difference=((sub_last-sub_first)*1000000000).to_i
puts difference
