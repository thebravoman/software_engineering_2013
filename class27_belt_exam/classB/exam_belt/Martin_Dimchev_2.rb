require 'csv'

array=[]
result=[]

filename=ARGV[0]
CSV.foreach(filename) do |row|
        if (ARGV[1] != row[1])
            array << row
        end
end

i=0
array.each do |row|
        row[0]=row[0].gsub("champ_","")
        result << [row[3],row[0].gsub("_"," ")]
        i+=1
end

result = result.sort_by{|a,b| a.to_f}.reverse

CSV.open("champs_result.csv", "w") do |csv|
        result.each do |row|
                csv << row
        end
end
