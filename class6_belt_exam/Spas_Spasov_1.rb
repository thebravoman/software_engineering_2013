require 'csv'
debit=0.00
CSV.foreach("bank.csv") do |row|
en = row[3].to_s
if row[3] = en then {
debit = debit + row[2].to_f
}end

printf"%0.2f\n", debit




CSV.open("bank_results.csv", "w") do |csv|
end
	
