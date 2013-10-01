require 'csv'
correct = []
wrong = []
CSV.foreach(ARGV[0]) do |row|
	names = row[0].split("_")[0..1]
	name = names[0] + " " + names[1]
	if row[2] == 'true'
		correct << name
	else
		wrong << name+" "+row[1]
	end
end
puts correct.sort
puts
puts wrong.sort
