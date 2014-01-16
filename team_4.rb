Dir.glob("*.rb") do |file|
	result = `ruby #{file}`

	CSV.foreach("result.csv") do |row|
	
	
	end
end
