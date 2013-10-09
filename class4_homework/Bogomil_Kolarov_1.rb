require 'csv'

hash = {}

CSV.foreach(File.join(ARGV[0],"Evaluation 2013-2014 - Sheet2.csv")) do |row|
	next if row[0].to_s.length != 1
	next if row[3].nil?
	row[1] = row[1].downcase.to_s << ' ' << row[2].downcase.to_s
	hash[row[3].downcase] = [row[1],0,0]
end


CSV.foreach(File.join(ARGV[0],"results1.csv")) do |row|
	name = row[0].split('_1.rb')[0].tr('_', ' ').downcase

	if hash.has_key? (name)
		hash[name][1] = row[2] == 'true' ? 1 : 0 
	end
end

CSV.foreach(File.join(ARGV[0],"results3.csv")) do |row|
	name = row[0].split('_3.rb')[0].tr('_', ' ').downcase

	if hash.has_key? (name)
		hash[name][2] = row[2] == 'true' ? 1 : 0 
	end
end

hash = hash.sort { |k,v| k[1][0] <=> v[1][0] }

CSV.open( 'results1.csv', 'wb' ) do |csv|
hash.each { |c| csv << c[1] }
end








