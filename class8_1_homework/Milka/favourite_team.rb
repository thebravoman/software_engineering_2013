require 'csv'
played = Array.new()
team = ARGV[1]
CSV.foreach(ARGV[0]) do |csv|
	
	played << csv if team == csv[1].split("-")[0] || team == csv[1].split("-")[1]
end
played.sort!
CSV.open("favourite_team_result.csv", "w") do |row|
	played.each do |element|
		row << element
	end
end
