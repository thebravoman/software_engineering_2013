require 'csv'

hash = Hash.new(0.0)
hash[""] = 0.0
b=0.0
bk=""

CSV.foreach('bank.csv') do |row|
	hash[row[0]] += row[1].to_f
end

hash.each do |k,st|
	if b < st
		b = st
		bk = k
	end
end

puts bk
