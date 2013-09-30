require "csv"

income = 0.00
expense = 0.00
balance = 0.00
dnevno = 0.00
dnevnomax = 0.00
data = ''
poslednadata = ''
CSV.foreach("text_file.csv") do |row|
	if poslednadata != row[0].to_s
		dnevno = 0.00
		poslednadata = row[0].to_s
	end
	dnevno = dnevno + row[1].to_f - row[2].to_f
	if dnevno > dnevnomax
		dnevnomax = dnevno
		data = poslednadata
	end
end
puts data
