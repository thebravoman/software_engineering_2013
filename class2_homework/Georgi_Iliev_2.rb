require "csv"

m_one= 00
CSV.foreach("bank.csv") do |row|
	m_one = m_one + row[1].to_f
end

puts m_one