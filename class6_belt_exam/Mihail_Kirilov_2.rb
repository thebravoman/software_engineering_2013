require 'csv'
input_file = ARGV[0]
money = {}
moneyy = 0
CSV.foreach(input_file) do |row| 
	if row[2] != nil
	row[4] = row[4]
	va = row[4]
	valut = va.gsub(/\s\w+/,"")
	p valut
	money[valut] = row[2] 
	
	end
end
p money

CSV.open(input_file + "_results.csv", "w") do |file|  
	
end
