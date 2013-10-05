filename = 'bank.csv'

require 'csv'

hash = Hash.new(0.0)
CSV.foreach(filename) do |row|
	hash[row[0]] += row[1].to_f
end
puts hash.max_by {|k,v| v}[0]
