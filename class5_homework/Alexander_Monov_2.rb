#/usr/bin/ruby

first_subtitle = 0
last_subtitle = 0

File.readlines(ARGV[0]).each do |line|
    if line =~ /-->/
        last_subtitle = line[17..29]
    end
    next unless first_subtitle == 0
    if line =~ /-->/
        first_subtitle = line[0..11]
    end
end


a = (first_subtitle[0..1].to_i*60*60*1000 + first_subtitle[3..4].to_i*60*1000 + first_subtitle[6..7].to_i*1000 + first_subtitle[9..11].to_i)
b = (last_subtitle[0..1].to_i*60*60*1000 + last_subtitle[3..4].to_i*60*1000 + last_subtitle[6..7].to_i*1000 + last_subtitle[9..11].to_i)
p (b-a)*1000*1000
