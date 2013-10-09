firstl = 0
lastl = 0
File.open(ARGV[0]).each do |line|
if line =~ /-->/
lastl = line[17..29]
end
next unless firstl == 0
if line =~ /-->/
firstl = line[0..11]
end
end
starttime = ( firstl[0..1].to_i*60*60*1000*1000*1000 + firstl[3..4].to_i*60*1000*1000*1000 + firstl[6..7].to_i*000*1000*1000 + firstl[9..11].to_i*1000*1000 )
endtime = ( lastl[0..1].to_i*60*60*1000*1000*1000 + lastl[3..4].to_i*60*1000*1000*1000 + lastl[6..7].to_i*000*1000*1000 + lastl[9..11].to_i*1000*1000 )
nanos = endtime - starttime
p nanos
