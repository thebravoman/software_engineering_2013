require 'csv'
# encoding: UTF-8
names = Hash.new{[0..3]}
val = [0..3]

def parse_name(file_name)
	names = file_name.split("_")[0..1]
	return "" if names[0] == nil
	name = names[0] + " " + names[1]
end
CSV.foreach("#{ARGV[0]}/results1.csv") do |line|
	name = parse_name(line[0])
	val[0] = line[2]
    	names[name] = val.dup
end
CSV.foreach("#{ARGV[0]}/results3.csv") do |line|
	name = parse_name(line[0]);
	val = names[name]
	val[1] = line[2]
	names[name] = val
end
CSV.foreach("#{ARGV[0]}/names.csv") do |line|
	name = line[3]
	if names.has_key?(name)
		val = names[name]
		val[2] = line[1] + " " + line[2]
		names[name] = val
	end
end
#names = names.sort_by { |key,arr| arr[2] }
f = CSV.open( 'results1.csv', 'wb' )
names.each do |key, value|
	f << [value[2]] + [value[0]] + [value[1]]
end
f.close