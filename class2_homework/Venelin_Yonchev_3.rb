require 'csv'

v = Hash.new( 0.0 )
v[""] = 0.0
CSV.foreach( 'bank.csv' ) do |row|
	v[row[0]] += row[1].to_f
end
puts ( v.max_by { |d,m| m } )[0]
