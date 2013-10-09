require 'csv'

name = {}
result1 = {}
result2 = {}

CSV.foreach(File.join(ARGV[0],"Evaluation 2013-2014 - Sheet2.csv")) do |row|
	if((row[0].to_s.length) != 1)
	next
	else
	name[row[3]] = row[1].to_s + " " + row[2].to_s
	end
end
CSV.foreach(File.join(ARGV[0],"results1.csv")) do |r|
	 names = r[0].split("_")[0..1]
        enames = names[0].to_s + " " + names[1].to_s
if n.has_key?(enime) and r[2] == "true"
n[enime][1] = 1
elsif n.has_key?(enime) and r[2] == "false"
n[enime][1] = 0
end
end

CSV.foreach(File.join(ARGV[0],"results3.csv")) do |r|
names = r[0].to_s.split("_")[0..1]
enames = names[0].to_s + " " + names[1].to_s
if n.has_key?(enames)
n[name][2] = r[2]== "true" ? 1 : 0
end
end	

	CSV.open("results.csv", "w") do |csv|

names.sort{ |a, b| a <=> b }.each do |row|
if((r1[row[0]]) || (r2[row[0]]))
csv << [row[1], r1[row[0]], r2[row[0]]]
end
end
end
