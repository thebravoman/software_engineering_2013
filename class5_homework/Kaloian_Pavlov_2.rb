purvlin=0
posllin=0
File.open(ARGV[0]).each do |line|
  if line =~ /-->/
    posllin = line[17..29]
  end
  next if purvlin != 0
    if line =~ /-->/
    purvlin = line[0..11]
  end
end

h=60*60*1000*1000*1000
m=60*1000*1000*1000
s=1000*1000*1000
mil=1000*1000

nachvr = (purvlin[0..1].to_i*h + purvlin[3..4].to_i*m + purvlin[6..7].to_i*s + purvlin[9..11].to_i*mil)
krvr = (posllin[0..1].to_i*h + posllin[3..4].to_i*m + posllin[6..7].to_i*s + posllin[9..11].to_i*mil)
alltime = krvr - nachvr
puts alltime
