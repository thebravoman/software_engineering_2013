require 'csv'

def do_task( argument, sc )
        a = []
        sc = sc.nil? ? 5 : sc.to_i
        CSV.foreach( argument ) do |r|
                a << r
                a.sort_by! { |e| [e[1].to_i, e[0].to_i] }
                a = a.take( sc )
        end
        CSV.open( 'top.csv', 'wb' ) do |c|
                a.each { |e| c << e }
        end
end

do_task( ARGV[0], ARGV[1] )
