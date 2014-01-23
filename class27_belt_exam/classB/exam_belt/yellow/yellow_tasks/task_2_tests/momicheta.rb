require "csv"
godini_sort=Array.new
relationship = ARGV[1]
CSV.foreach(ARGV[0]) do |row|
	if row[3]== relationship
		godini_sort << row
		p row
	end
end

godini_sort.sort_by! {|e| e[1].to_i}

CSV.open("momicheta_result.csv","w") do |csv|
	godini_sort.each do |e|
		csv << e
	end
end 