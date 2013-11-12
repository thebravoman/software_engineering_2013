require "csv"

def make_task(read_from, count)
        
        player_arr = []
        count = count.nil? ? 5 : count.to_i
        
        CSV.foreach(read_from) do |row|
                player_arr << row
                player_arr = player_arr.sort_by { |e| [e[1].to_i, e[0].to_i] }.reverse
                player_arr = player_arr.take(count)
        end
        
        CSV.open( "top.csv", "wb" ) do |csv|
                player_arr.each { |e| csv << e }
        end
        
end

make_task( ARGV[0], ARGV[1] )
