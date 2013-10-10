first_line=0
last_line=0
hour=60*60*1000*1000*1000
minute=60*1000*1000*1000
second=1000*1000*1000
milisecond=1000*1000

File.open(ARGV[0]).each do |line|
  if line =~ /-->/
    last_line = line[17..29]
  end
  next if first_line != 0
    if line =~ /-->/
    first_line = line[0..11]
  end
end

begin_time = (first_line[0..1].to_i*hour + first_line[3..4].to_i*minute + first_line[6..7].to_i*second + first_line[9..11].to_i*milisecond)
end_time = (last_line[0..1].to_i*hour + last_line[3..4].to_i*minute + last_line[6..7].to_i*second + last_line[9..11].to_i*milisecond)
p begin_time - end_time
