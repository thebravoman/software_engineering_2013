require 'csv'
country=Hash.new{0}
splitter=0

CSV.foreach(ARGV[0]) do |row|

	splitter=row[0]
	splitter_min=splitter.split(":")[1] 
	splitter=splitter.split(":")[0]

	if ((splitter.to_i<=06) && (splitter_min.to_i<=20))
	 country[row[3]]+=row[1].to_i
	else
		next
	end
end

country=country.sort_by{|a,b,c,d|b}


CSV.open("#{ARGV[0].chomp(".csv")}_results.csv","w") do |csv|
		country.each do |a,b|
  	  csv << [b,a]
 		end
end

