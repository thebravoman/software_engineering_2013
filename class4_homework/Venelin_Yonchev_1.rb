require 'csv'

students = {}
CSV.foreach( File.join( ARGV[0], 'names.csv')) do |row|
	next if row[0].to_s.length != 1
		row[1] = row[1].strip + " " + row[2].strip
	if row[3].nil? then  row[3] = row[1]
	end
	students[row[3]] = [row[1], 0, 0]
end
CSV.foreach( File.join( ARGV[0], 'results1.csv' ) ) do |row|
	n = row[0].split( '_1.rb' )[0].tr( '_', ' ' )
	next unless students.has_key?( n )
	students[n][1] = row[2] == 'true' ? 1 : 0
end
CSV.foreach( File.join( ARGV[0], 'results3.csv' ) ) do |row|
	n = row[0].split( '_3.rb' )[0].tr( '_', ' ' )
	next unless students.has_key?( n )
	students[n][2] = row[2] == 'true' ? 1 : 0
end
students = students.sort { |a,b| a[1][0] <=> b[1][0] }
CSV.open( 'results1.csv', 'wb' ) do |c|
	students.each { |x| c << x[1] }
end