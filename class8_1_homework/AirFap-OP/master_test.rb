require 'csv'
require 'date'

def diff(res,cmd)
	res2 = ""
	if res
		`#{cmd}`
		res2 = `diff -N champs_result.csv champs_result_exp.csv`
		if res2 == ""
			p "true"
		else
			p "false"
		end
	else
		p "Can't compile program #{ARGV[0]}"
	end
end

def test_1
	info = Hash.new {0.0}
	CSV.foreach("champs.csv") do |row|
		next if row[1].to_s != "Mage"
		info[row[0].gsub("champ_","").gsub("_"," ")] = row[3].to_i
	end
	info = info.sort_by {|a,b| b}
	CSV.open("champs_result_exp.csv","w") do |csv|
		info.each do |a,b|
			csv << [a,b]
		end
	end
	cmd = "ruby #{ARGV[0]} champs.csv Mage"
	res1 = system cmd
	diff(res1,cmd)
end

def test_2
	info = Hash.new {0.0}
	CSV.foreach("champs.csv") do |row|
		if row[1].to_s.include?("Fighter")
			info[row[0].gsub("champ_","").gsub("_"," ")] = row[3].to_i
		end
	end
	info = info.sort_by {|a,b| a}
	CSV.open("champs_result_exp.csv","w") do |csv|
		info.each do |a,b|
			csv << [a,b]
		end
	end
	cmd = "ruby #{ARGV[0]} champs.csv Fighter"
	res1 = system "#{cmd}"
	diff(res1,cmd)
end

def test_3
	info = Hash.new {0.0}
	testdate = "2012-05-12"
	CSV.foreach("champs.csv") do |row|
		next if Date.parse(row[2]) >= Date.parse(testdate)
		info[row[0].gsub("champ_","").gsub("_"," ")] = row[1]
	end
	info = info.sort_by {|a,b| b}.reverse
	CSV.open("champs_result_exp.csv","w") do |csv|
		info.each do |a,b|
			csv << [a,b]
		end
	end
	cmd = "ruby #{ARGV[0]} champs.csv #{testdate}"
	res1 = system "#{cmd}"
	diff(res1,cmd)
end

def test_4
	info = Hash.new {0.0}
	CSV.foreach("champs.csv") do |row|
		next if row[3].to_i != 3150
		info[row[0].gsub("champ_","").gsub("_"," ")] = [row[1],row[2].gsub("date_",""),row[3].to_i]
	end
	info = info.sort_by {|a,b| b[0]}
	CSV.open("champs_result_exp.csv","w") do |csv|
		info.each do |a,b|
			csv << [a,b[0],b[1],b[2]]
		end
	end
	cmd = "ruby #{ARGV[0]} champs.csv 3150"
	res1 = system "#{cmd}"
	diff(res1,cmd)
end

def test_5
	info = Hash.new {0.0}
	CSV.foreach("champs.csv") do |row|
		next if row[0].gsub("champ_","").gsub("_"," ").split('').last != "e"
		info[row[0].gsub("champ_","").gsub("_"," ")] = row[1]
	end
	info = info.sort_by {|a,b| a}.reverse
	CSV.open("champs_result_exp.csv","w") do |csv|
		info.each do |a,b|
			csv << [a,b]
		end
	end
	cmd = "ruby #{ARGV[0]} champs.csv e"
	res1 = system "#{cmd}"
	diff(res1,cmd)
end

def test_6
	info = Hash.new {0.0}
	CSV.foreach("champs.csv") do |row|
		if row[0].gsub("champ_","").gsub("_"," ").include?('e')
			info[row[0].gsub("champ_","").gsub("_"," ")] = row[0].gsub("champ_","").gsub("_"," ").count('e')
		end
	end
	info = info.sort_by {|a,b| a}
	CSV.open("champs_result_exp.csv","w") do |csv|
		info.each do |a,b|
			csv << [a,b]
		end
	end
	cmd = "ruby #{ARGV[0]} champs.csv e"
	res1 = system "#{cmd}"
	diff(res1,cmd)
end

`mkdir Exec`
`cp #{ARGV[0]} Exec`
`cp champs.csv Exec`
Dir.chdir("Exec")

if ARGV[0] =~ /1/
	test_1
elsif ARGV[0] =~ /2/
	test_2
elsif ARGV[0] =~ /3/
	test_3
elsif ARGV[0] =~ /4/
	test_4
elsif ARGV[0] =~ /5/
	test_5
elsif ARGV[0] =~ /6/
	test_6
else
	p "Wrong filename for #{ARGV[0]}"
end

	Dir.chdir("..")
`rm -f Exec -r`
