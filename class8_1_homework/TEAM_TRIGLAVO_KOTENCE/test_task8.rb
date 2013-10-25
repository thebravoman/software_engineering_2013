require "csv"
string = ""
string1 = ""
`ruby alcohol_kolichestvo.rb Vodka`
File.open("results.csv", "r") do |file|
	while line = file.gets
		string =  string + line.to_s
	end
end
File.open("r.csv", "r") do |f|
	while l = f.gets
		string1 = string1 + l.to_s
	end
end

if string == string1
	puts "true"
else
	puts "false"
end
