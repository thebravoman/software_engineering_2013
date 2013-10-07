require 'csv'

all = []
imena = []

CSV.foreach(File.join(ARGV[0],"Evaluation 2013-2014 - Sheet2.csv")) do |row|
if row[0].to_s.length == 1
	name = row[1].strip << ' ' << row[2].strip
	row[3] = name if row[3].nil?
	imena << [name,row[3]]
all << [row[3], 0, 0]
end
end

CSV.foreach(File.join(ARGV[0],"results1.csv")) do |row|
n2=row[0].to_s.split("_")[0..1]
n1=n2[0].to_s + " " + n2[1].to_s
all.each do |e|
		if e[0]==n1
			if row[2]=="true"
				e[1]=1
			else
				e[1]=0
			end
		end
end
end

CSV.foreach(File.join(ARGV[0],"results3.csv")) do |row|
n2=row[0].to_s.split("_")[0..1]
n1=n2[0].to_s + " " + n2[1].to_s
all.each do |e|
	if e[0]==n1
		if row[2]=="true"
			e[2]=1
		else
			e[2]=0
		end
	end
end
end

all.each do |e|
imena.each do |el|
	if e[0]==el[1]
		e[0]=el[0]
	end
end
end

all = all.sort_by { |key,value| key }

CSV.open("results1.csv", "w") do |csv|
all.each do |e|
csv << e
end
end
