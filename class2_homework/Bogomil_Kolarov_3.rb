require 'csv'

def largest_hash_key(hash)
	hash.sort{|a,b| a[1] <=> b[1]}.last
	hash.each { |k, v| puts k if v == hash.values.max }
end

arr = Hash.new( 0.0 )
arr[""] = 0.0
CSV.foreach( 'bank.csv' ) do |row|
	arr[row[0]] += row[1].to_f
end
largest_hash_key(arr)
