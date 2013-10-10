require 'csv'
debit = Array.new
CSV.each(ARGV[0]) do |row|
 if row[4].to_s.length !=3 
	row[2] = row[2]*1.95583
	debit << row[2] 
 elsif row[4][0..2].split == EUR 
	row[2] = row[2]
	debit << row[2]
 else
	row[2] = row[2]*1.95583
	debit << row[2]
 end
end
