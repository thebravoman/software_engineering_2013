#/usr/bin/ruby

require 'time'

subs = []
time1 =[]
time2 =[]

file = File.open("Alexander_Monov.txt", "w")

File.foreach(ARGV[0]) do |line|
        if line =~ /-->/
                time1 << Time.parse(line.split(" --> ")[0])                
                time2 << Time.parse(line.split(" --> ")[1])
                
        end
        
        if ((line[0].ord >= 'a'.ord ) && (line[0].ord <= 'z'.ord)) || ((line[0].ord >= 'A'.ord) && (line[0].ord <= 'Z'.ord))
                subs << line
        end
end

i =0
while i != time1.length do
        if (time1[i+1].to_f) - (time2[i].to_f) >= 3
                file.write subs[i].chomp
                file.write "\n"
                file.write "\n"
                i+=1
        else
                file.printf subs[i].chomp
                i+=1
        end
end
file.close
