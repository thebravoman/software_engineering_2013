require 'csv'
require 'date'

DATE_FORMAT = "%d/%m/%Y %H:%M:%S"
deadline = DateTime.parse( '2013-09-30T16:00:00+03:00' )
students = {}

CSV.foreach("../class4_homework/test_data/names.csv") do |row|
        next if row[0].to_s.length() != 1 
        name = row[1].strip + " " + row[2].strip
        if row[3].nil? then
                 row[3] = name
        end
        students[row[3]] = [name,"",0]
end        

CSV.foreach("../class2_homework/results1.csv") do |row|
        names = row[0].split('_')[0..1]
        name = names[0].strip + names[1].strip
        next unless students.has_key?(name)
        path = File.join("../class2_homework/", row[0]).to_s
        turn_in = DateTime.strptime(`git log --format="format:%ct" -- #{path}`.lines.chomp.first, "%s")
        students[name][1] = turn_in
        students[name][2] = 1 if turn_in <= deadline 
end

CSV.foreach("../class2_homework/results3.csv") do |row|
        names = row[0].split('_')[0..1]
        name = names[0].strip + names[1].strip
        next unless students.has_key?(name)
        path = File.join("../class2_homework/", row[0]).to_s
        turn_in = DateTime.strptime(`git log --format="format:%ct" -- #{path}`.lines.chomp.first, "%s")
        students[name][1] = turn_in if students[name][1] < turn_in
        students[name][2] = 0 if turn_in > deadline 
end

CSV.open("results2.csv","wb") do |csv|
        students.each {|key,val|csv << [val[0],val[1].to_s,val[2]]}
end
