require "csv"

income = Array.new
expense = Array.new
dati = Array.new
broqch = 0
CSV.foreach("bank.csv") do |row|
	if dati.include?(row[0]) == true
		income[dati.index(row[0])] += row[1].to_f
	else
		dati[broqch] = row [0]
		income[broqch] = row[1].to_f
		broqch = broqch+1
	end	
end
puts dati[income.index(income.max)]

#puts "#{income},#{expense},#{income-expense}"

