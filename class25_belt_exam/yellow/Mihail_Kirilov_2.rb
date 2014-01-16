require 'csv'
champ_class = ARGV[1]
arr = []
CSV.foreach(ARGV[0]) do |row|
	if row[1].split("/")[0] != champ_class
		if row[1].split("/")[1] != champ_class
			arr << [row[0],row[3]]
		end
	end
end

arr.each do |row|
	row[0].gsub!("champ_","")
	row[0].gsub!(/._/,".")
	row[0].gsub!("."," ")
end

arr.sort_by! {|a,b|b.to_i}
arr.reverse!

CSV.open("Mihail_Kirilov_2_results.csv", "w") do |io|
	arr.each do |row|
	 io << row
	end
end