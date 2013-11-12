require 'csv'
a = Array.new
fname = ARGV[0]
ta_lo = ARGV[1]

CSV.open("#{fname}","r").each do |r|
	if r[3].strip == ta_lo
		a << r 
	end 
end

a = a.sort{|a,b| a[1]<=>b[1]}

CSV.open("momicheta_result.csv","w") do |csv|
	a.each do |e|
		csv << e
	end
end
