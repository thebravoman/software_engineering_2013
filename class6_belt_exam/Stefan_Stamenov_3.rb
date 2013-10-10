require 'csv'

mas=[]
arr=[]
CSV.foreach(ARGV[0],ARGV[1]) do |row|

	next if row[2].nil?
	if  row[2].to_i>ARGV[1].to_i
	mas<<row
	end

end

arr=ARGV[0].split(".csv")[0]

mas=mas.sort

CSV.open(arr+"_result.csv",'w') do |csv|
	mas.each do |deb|
	csv<<deb
end
end
