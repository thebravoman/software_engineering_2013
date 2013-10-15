def time(string)
        time = string.split(":")
        h  = time[0].to_i
        m = time[1].to_i
        s = time[2].split(",")[0].to_i
        ms = time[2].split(",")[1].to_i
        return h*60*60*1000 + m*60*1000 + s*1000 + ms
end
numb = 0.0
text = Array.new
new_line = 0
trigger = 0;
is_time = false
File.open(ARGV[0],"r").each do |row|
        if (row =~ /-->/)
                is_time = true
                row = row.strip.split("-->")
                row[0] = time(row[0])
                row[1] = time(row[1])
                if (numb+3000 < row[0])
                        new_line = 1
						if(trigger == 0)
							trigger = 1
							text << " "
						else
							text << "\r\n" + "\r\n"
						end
                end 
                numb = row[1]
        end
        if (new_line != 1 && is_time == false && !(row =~ /^[0-9]/) && !(row.empty?))
                        text << row.strip
        end
        new_line = 0
        is_time = false
end
File.open("parsed_subtitles.txt","w") do |file|
        text.each_with_index do |texta,index|
			file << texta + " "
        end
end
