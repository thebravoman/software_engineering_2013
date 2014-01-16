require 'csv'

	mqu = []
	bau = []
	kuche = []
	
	CSV.foreach(ARGV[0], 'r') do |row|
		if row[1].split("/")[0]  == ARGV[1] || row[1].split("/0")[1] == ARGV[1]
			row[0] = row[0].split("_")[0] + row[0].split("_")[1]
			bau = row[0] + "" + row[3]
			mqu << bau
			
		end
		mqu.sort{|a,b| b<=>a}
	end
	
	broqch = 0
	string = ARGV[0].to_s
	string = string.split(".")[0]
	string += "_results.csv"
	
	CSV.open(string, 'w') do |ako|
		mqu.each do |laino|
			ako << [laino]
		end
	end
