require 'csv'

result = Hash.new(0)

CSV.foreach(ARGV[0]) do |row|
        name = row[0].gsub("champ_","").gsub("_"," ")
        klas = row[1].split("/")
        if klas[0] != ARGV[1] && klas[1] != ARGV[1]
                result[name] = row[3].to_i
        end
end

result = result.sort_by{|result|result[1]}.reverse

CSV.open("champs_result.csv", "w") do |csv|
        result.each do |element|
                csv << element
        end
end
