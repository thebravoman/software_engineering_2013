require 'csv'


years = ARGV[1].to_i
girls = []
CSV.foreach("#{ARGV[0]}") do |row|
	if row[3] == 'Sama' and row[1].to_i - 2 <= years and row[1].to_i + 2 >= years
 		girls << row
	end
end

girls = girls.sort_by{|a,b| b}

CSV.open("#{ARGV[0].gsub(/.csv/, "")}" + "_result.csv", "w") do |csv|
  girls.each do |file|
    csv << file
  end
end

#http://puu.sh/6mWB5.png :)))
