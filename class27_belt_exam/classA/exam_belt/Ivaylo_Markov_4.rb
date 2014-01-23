require 'csv'
require 'date'

champs = []
std = []

CSV.foreach(ARGV[0]) do |row|
	champs << row
end

champs.each_index do |n|
	champs[n][2] = DateTime.parse(champs[n][2])
	champs[n][0] = champs[n][0].gsub("champ_","")
champs[n][0] = champs[n][0].gsub("champ_"," ")
end

champs = champs.sort {|ch1,ch2| ch1[2] <=> ch2[2]}

std << [champs[0][2],champs[0][0], champs[0][3]]
std << [champs[9][2],champs[9][0], champs[9][3]]
std << [champs[-1][2],champs[-1][0], champs[-1][3]]

std = std.sort {|s1,s2| s1[2] <=> s2[2]}
std.each do |s|
	s[0] = s[0].strftime("%Y-%m-%d")
end

CSV.open(ARGV[0]+"_result.csv","wb") do |csv|
	std.each do |s|
		csv << s
	end
end
