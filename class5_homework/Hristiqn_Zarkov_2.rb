def to_nano_time(time)   
        time = time.split(":")
        time[2] = time[2].split(",")
        time = (time[0].to_i*60*60*1000*1000*1000) + (time[1].to_i*60*1000*1000*1000) + (time[2][0].to_i*1000*1000*1000) + (time[2][1].to_i*1000*1000)
end
file_lines = File.readlines(ARGV[0])

start_time = 0
i = 0

while (start_time == 0) do
        if file_lines[i].include?("-->")
                start_time = file_lines[i][0..12]
        end
        i += 1
end
end_time = 0
i = -1

while (end_time == 0) do
        if file_lines[i].include?("-->")
                end_time = file_lines[i][18..-3]
        end
        i -= 1
end
start_time = to_nano_time(start_time)
end_time = to_nano_time(end_time)

time = end_time - start_time
p time
