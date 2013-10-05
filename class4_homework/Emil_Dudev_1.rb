#/usr/bin/ruby

require 'csv'

d = {}
CSV.foreach( File.join( ARGV[0], 'names.csv' ) ) do |s|
	next if s[0].to_s.length != 1
	s[1] << ' ' << s[2]
	s[3] = s[1] if s[3].nil?
	d[s[3]] = [s[1], 0, 0]
end
CSV.foreach( File.join( ARGV[0], 'results1.csv' ) ) do |e|
	n = e[0].split( '_1.rb' )[0].gsub( /_/, ' ' )
	next unless d.has_key?( n )
	d[n][1] = e[2] == 'true' ? 1 : 0
end
CSV.foreach( File.join( ARGV[0], 'results3.csv' ) ) do |e|
	n = e[0].split( '_3.rb' )[0].gsub( /_/, ' ' )
	next unless d.has_key?( n )
	d[n][2] = e[2] == 'true' ? 1 : 0
end
d = d.sort { |a,b| a[0] <=> b[0] }
CSV.open( 'results1.csv', 'wb' ) do |c|
	d.each { |s| c << s[1] }
end

