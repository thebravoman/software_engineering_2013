require 'csv'
require 'date'

name=ARGV[1]
m={}

CSV.foreach(ARGV[0]) do |row|

	if (row[3].to_i==ARGV[1].to_i)
	mach=row[0] + " " + row[1]+" "+row[2] + " " + row[3]
	date=Date.parse(row[4])
	date=date.strftime('%d/%m/%Y')
	m[mach]=date
	end
end

m=m.sort_by{|k,v| v}.reverse

CSV.open("#{ARGV[0].chomp(".csv")}_result.csv","w") do |csv|
        m.each() do |el|	
        	csv << el
end
end
