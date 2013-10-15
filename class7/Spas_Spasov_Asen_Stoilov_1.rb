def time(string)
        time = string.split(":")
        h  = time[0].to_i
        m = time[1].to_i
        s = time[2].split(",")[0].to_i
        ms = time[2].split(",")[1].to_i
        return h*60*60*1000 + m*60*1000 + s*1000 + ms
end
n = 0.0
text = Array.new
nl = 0
now = false
File.open(ARGV[0],"r").each do |row|
        if (row =~ /-->/)
                now = true
                row = row.strip.split("-->")
                row[0] = time(row[0])
                row[1] = time(row[1])
                if (n+3000 < row[0])
                        nl = 1
                        text << "\r\n"
                end 
                n = row[1]
        end
        if (nl != 1 && now == false && !(row =~ /^[0-9]/) && !(row.empty?))
                        text << row.strip
        end
        nl = 0
        now = false
end
File.open("Spas_Spasov_Asen_Stoilov_1.txt", "w") do |file|
        text.each_with_index do |texta,index|
                if (index%3 == 0 || index == 0)
                        file << texta
                end
        end
end
