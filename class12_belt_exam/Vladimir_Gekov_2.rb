require 'csv'

def do_task( input, count )
	a = []
	count = count.nil? ? 5 : count.to_i
	CSV.foreach( input ) do |r|
		a << r
		a.sort_by! { |e| [e[1].to_i, e[0].to_i] }.reverse!
		a = a.take( count )
	end
	CSV.open( 'top.csv', 'wb' ) do |c|
		a.each { |e| c << e }
	end
end

do_task( ARGV[0], ARGV[1] ) 
