require 'csv'

result=[]

filename=ARGV[0]
phone=ARGV[1].to_s
CSV.foreach(filename) do |row|
        if (row.include? phone.to_s)
            result << row
        end
end

result = result.sort_by{|a,b| b.to_i}

CSV.open("momi4eta_result.csv", "w") do |csv|
        result.each do |row|
                csv << row
        end        
        
end
