require 'csv'

girls = Array.new

CSV.foreach(ARGV[0]) do |row|
	if ARGV[1].to_i+2 >= row[1].to_i && row[1].to_i >=ARGV[1].to_i-2 && row[3].to_s == "Sama"
			girls << row
	end
end


girls =	girls.sort_by{|a| a[1]}


CSV.open("momicheta_result.csv", "w") do |csv|
	girls.each do |element|
		csv << element
	end

end