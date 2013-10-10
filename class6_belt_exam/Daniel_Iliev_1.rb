require "csv"

currency = 0

CSV.foreach(ARGV[0]) do |row|
		currency = ARGV[1]
		if row[3].to_s == "BGN" && currency == "BGN"
				puts row[2].to_f
		elsif row[3].to_s == "EUR" && currency == "EUR"
				puts row[2].to_f
		end
end
