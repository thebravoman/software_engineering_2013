require 'csv'

max=0.00
data=""
CSV.foreach('bank.csv') do |row|
if row[1].to_f>max
max=row[1].to_f
data=row[0]
end
end
puts data
