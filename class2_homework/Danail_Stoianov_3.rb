require 'csv'

d = Hash.new( 0.0 )

CSV.foreach( 'bankDSK.csv' ) do |row|
  d[ row[0] ] += row[1].to_f
end

puts ( d.max_by { |d, c| c } )[0]
