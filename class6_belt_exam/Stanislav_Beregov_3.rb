require 'csv'
NUM = ARGV[1].to_f
results = {}
CSV.foreach(ARGV[0]) do |line|
	if line[2].to_f > NUM
		results[line[2].to_f] = []
		results[line[2].to_f][0] = line[0]
		results[line[2].to_f][1] = line[1]
		results[line[2].to_f][2] = line[2]
		results[line[2].to_f][3] = line[3]
		results[line[2].to_f][4] = line[4]
		results[line[2].to_f][5] = line[5]
	end
end
results = results.sort_by {|k,v| k}.reverse
f = CSV.open("#{ARGV[0].split(".")[0]}_result.csv", "wb")
results.each do |key, val|
	f << [[val[0].to_s] , [val[1].to_s] , [val[2].to_s] , [val[3].to_s] , [val[4].to_s] , [val[5].to_s]]
end
f.close()
