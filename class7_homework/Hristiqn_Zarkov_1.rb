def time(string)
        time = string.split(":")
        h  = time[0].to_i
        m = time[1].to_i
        s = time[2].split(",")[0].to_i
        ms = time[2].split(",")[1].to_i
        return h*60*60*1000 + m*60*1000 + s*1000 + ms
end

numb = 0
text = Array.new()

File.open(ARGV[0],"r").each do |row|
        if (row =~ /-->/)
                text.pop
                text.pop
                row = row.strip.split("-->")[0..1]
                row[0] = time(row[0])
                row[1] = time(row[1])
                if (numb+3000 < row[0])
                        if (text.length > 0)
                                text[-1][-1]= ""
                                text << "\r\n"
                        end
                end 
                numb = row[1]
        else        
                text << row.strip + " "
        end
end       
text[-1][-1]= ""
text << "\r\n"
File.open(ARGV[1],"w") do |file|
        text.each do |texta|
                        file << texta
        end
end
