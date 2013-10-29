require 'csv'

best = Hash.new(0)
CSV.foreach(ARGV[0]) do |csv|
	if best[csv[2]] < csv[3].to_f
		best[csv[2]] = csv[3].to_f
	end
 end
 
 best = best.sort_by{|a,b| b.to_f}.reverse
 CSV.open("best_worker_result.csv", "w") do |csv|
 	best.each do |el|
 	csv << el
 	end
 end
