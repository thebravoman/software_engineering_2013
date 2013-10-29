require 'csv'

co=0
male = 0
female = 0
full_name = []
repetative = {}
final = []

CSV.foreach(File.join(ARGV[0])) do |row|
	first_name = row[0].split(" ")[0]
	sec_name = row[0].split(" ")[1]
	full_name[co] = first_name + " " + sec_name
	co+=1
	if row[1] != nil
		if row[1].strip == "m"
			male += 1
		elsif row[1].strip == "f"
			female += 1
		end
	end
end
co = 0
full_name.each do |name|
	if repetative.has_key?(name)
		repetative[name] += 1
	else 
		repetative[name] = 1
	end
end
co = 0
repetative.each do |element|
	if element[1] > 1
		final[co] = element[0]
		co += 1
	end
end

$stdout = File.open("result_names.txt", "w")
puts female
puts male
puts final

