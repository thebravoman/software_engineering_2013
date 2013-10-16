require 'time'
end_time = nil
text = String.new()
text_nl = String.new()
prov = 0
diff = 0
File.open(ARGV[0]).each do |row|
        if row =~ /-->/
                split = row.split(" --> ")[0..1]
                start_time = Time.parse(split[0])
                
                diff = start_time - end_time  if end_time != nil
                end_time = Time.parse(split[1])        
                prov = 0
        elsif prov == 1
                if diff >= 3
                         text_nl.delete("\n")
        end
        text_nl << row
end
text.delete("\n")
text << "\n\n\t" << text_nl
File.open(ARGV[1], "w") do |row|
        text.each do |line|
                row << line
        end
end
