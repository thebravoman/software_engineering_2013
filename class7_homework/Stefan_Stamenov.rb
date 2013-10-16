require 'time'

arr=String.new
b=1
ftime=0
stime=0
nline=""

File.open(ARGV[0]).each do |line|

	if b==1 && line=~/-->/
	 s0 = line.split(" --> ")[1].split(/:|,/)
     ftime= s0[0].to_i*3600000 + s0[1].to_i*60000 + s0[2].to_i*1000 + s0[3].to_i
	b=0; 
	nline="" 
  elsif b!=1 && line=~ /-->/
	s1 = line.split(" --> ")[1].split(/:|,/)
    stime= s1[0].to_i*3600000 + s1[1].to_i*60000 + s1[2].to_i*1000 + s1[3].to_i
	if stime>=ftime+3000
		nline="\n"
		b=1
	end
 
end
if (!(line =~ /^[0-9]/) && !(line.empty?)&& !(line=~/-->/))
      line=line.split("\n")[0]
        if line==nil then next
          else   
          arr+=line+nline
          nline = ""
        end
end


  
end
 
File.open("#{ARGV[0].chomp(".srt")}_result.txt","w") do |file|
	file.write(arr)
end
