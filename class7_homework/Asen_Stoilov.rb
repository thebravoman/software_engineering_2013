
i=0
a=0
timenom=Array.new
text = String.new
sub=Array.new
File.open(ARGV[0],"r").each do |line|
temp = line.to_s
if (line =~ / --> /)

if (i==0)
timenom[0] = line[24..29].to_i
i=1
timenom[1] = line[24..29].to_i
else  
timenom[1] = line[7..12].to_i
i=0
end
if timenom[0] - timenom[1]>3000
a+=1
end
end

if (line !=~ / --> / && temp.length > 3)

sub[a] = temp << " "

end
end
g=0
while (g<a+1) do
text<< sub[g] <<"\n"
g+=1
end
File.open('Asen_Stoilov.txt', 'w')  do |file|
file.write(text)
end
