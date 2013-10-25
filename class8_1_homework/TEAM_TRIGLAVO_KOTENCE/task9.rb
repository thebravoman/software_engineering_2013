require "csv"
uchilishta = ""
CSV.foreach("uchilishta.csv") do |row|
	if ARGV[0].to_f >= row[1].to_f
		uchilishta += row[0].to_s + "\n"
	end	
end

File.open("results.csv", "w") do |file|
	file << uchilishta
end
