require 'csv'

girls=Array.new()
upyears = ARGV[1].to_i + 2
downyears = ARGV[1].to_i - 2
CSV.foreach(ARGV[0]) do |row|
	if row[3] == "Sama" && upyears > row[1].to_i && downyears < row[1].to_i
		girls << row
	end
end
girls.sort_by! {|a| a[1].to_i}
CSV.open("momicheta_result.csv","w") do |csv|
	girls.each do |f|
		csv << f
	end
end
	
	
