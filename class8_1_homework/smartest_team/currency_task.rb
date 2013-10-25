require 'csv'

currency=[]
CSV.foreach(ARGV[0]) do |row|
	if ARGV[2]==nil
		if row[2].to_f<ARGV[1].to_f
			currency << [row[0],row[1],row[2],row[3]]
		end
	else
		if row[2].to_f<ARGV[1].to_f && row[0]==ARGV[2]
			currency << [row[0],row[1],row[2],row[3]]
		end
	end
end

currency=currency.sort {|a,b| a[2] <=> b[2]}
CSV.open("#{ARGV[0].chomp(".csv")}_results.csv","w") do |csv|
	currency.each do |element|
		csv << element
	end
end
