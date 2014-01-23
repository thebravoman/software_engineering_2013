require 'csv'

array = []

CSV.foreach(ARGV[0]) do |row|
array << [row[2].split("_")[1],row[0].split("_")[1],row[3]]
end
array = array.sort_by{|a| a[0]}
array = array[0],array[9],array[-1]
array = array.sort {|a, b| a[2] <=> b[2]}

CSV.open("#{ARGV[0]}_result.csv", "w") do |csv|
        array.each do |element|
                csv << element
        end
end
