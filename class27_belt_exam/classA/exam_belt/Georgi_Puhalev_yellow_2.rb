require 'csv'
arr = []
digits=ARGV[1].to_s
CSV.foreach(ARGV[0]) do |row|
	p row[4]
	number = row.last.strip.to_s
	if number.include? digits
		arr << row
	end
end

arr = arr.sort_by {|e| e[1].to_i}
p arr

CSV.open("momicheta_result.csv", "w") do |csv|
        arr.each do |row|
                csv << row
        end
end
