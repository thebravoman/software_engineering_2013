require 'csv'

years=ARGV[1].to_i
momi=[]
CSV.foreach(ARGV[0]) do |row|
         if row[3] == 'Neobwyrzana' and row[1].to_i - 2 <= years and row[1].to_i + 2 >= years
                momi << row
        end
end

momi = momi.sort_by{|godini| godini[1].to_i}

CSV.open("momicheta_result.csv", "w") do |csv|
        momi.each do |inf|
                csv << inf
        end
end
