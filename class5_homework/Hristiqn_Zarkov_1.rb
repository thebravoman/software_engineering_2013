require 'date'
require 'csv'

last_date = DateTime.parse( 'Mon Sep 30 16:00:00 2013 +0300' )

names = Hash.new("")
CSV.foreach(File.join(ARGV[0],"Evaluation 2013-2014 - Sheet2.csv")) do |row|
        if (row[0].to_s.length == 1)
                if (row[3] == nil)
                        row[3] = ""
                end
                names[row[3]] = row[1].to_s + " " + row[2].to_s
        end
end

program_1 =  Hash.new("")
Dir.glob("*_1.rb").each do |file|
        result = `git log #{file}`
        lines = result.lines.to_a
        
        #date_string = lines[2][5..-1].strip
        date_string = lines[2].gsub("Date:","").strip
        date = DateTime.parse date_string  
        name = file.split("_")[0..1]
        name = name[0] + " " + name[1]
        program_1[name] = date
end

program_2 = Hash.new("")
Dir.glob("*_2.rb").each do |file|
        result = `git log #{file}`
        lines = result.lines.to_a
        #date_string = lines[2][5..-1].strip
        date_string = lines[2].gsub("Date:","").strip
        date = DateTime.parse date_string    
        name = file.split("_")[0..1]
        name = name[0] + " " + name[1]
        program_2[name] = date
end



is_ok = Hash.new("")
names.each do |row|
        if(program_1[row[0]] != "" && program_2[row[0]] != "")
                if ((program_2[row[0]] >= last_date) || (program_1[row[0]] >= last_date))
                        is_ok[row[0]] = "0"
                else
                        is_ok[row[0]] = "1"
                end
        else
                is_ok[row[0]] = "0"
        end
end

CSV.open("results2.csv","w") do |csv|
        names.each do |element|
                if (program_2[element[0]] == "")
                        date = program_1[element[0]]
                elsif (program_1[element[0]] == "")
                        date = program_2[element[0]]
                elsif (program_2[element[0]] > program_1[element[0]])
                        date = program_2[element[0]]
                else
                        date = program_1[element[0]]
                end
                csv << [element[1],date,is_ok[element[0]]]
        end
end
