require 'time'

first_sub=0
last_sub=0
i=0

File.open(ARGV[0]).each do |line|
    if line =~ /-->/ && j==0
       first_sub=Time.parse(line.split(" --> ")[0])
        i=i+1
    end
    if line =~ /-->/
     last_sub=Time.parse(line.split(" --> ")[1])
    end
end
last_sub=(last_sub-first_sub)*1000000000
puts last_sub.to_i
