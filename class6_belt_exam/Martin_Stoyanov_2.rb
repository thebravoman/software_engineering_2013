require 'csv'

eur=0
bgn=0
gbp=0
usd=0
huf=0
czk=0
rsd=0

CSV.foreach(ARGV[0]) do |row|
case currency
	when row[4]=~/EUR/
		eur+=row[2].to_i
	when row[4]=~/BGN/
		bgn+=row[2].to_i
	when row[4]=~/GBP/
		gbp+=row[2].to_i
	when row[4]=~/USD/
		usd+=row[2].to_i
	when row[4]=~/HUF/
		huf+=row[2].to_i
	when row[4]=~/CZK/
		czk+=row[2].to_i
	when row[4]=~/RSD/
		rsd+=row[2].to_i
end
CSV.open(ARGV[0].gsub(".csv", "_result.csv").strip, "w") do |csv|
	csv << [eur,bgn,gbp,usd,huf,czk,rsd]   #T_T
end
end
