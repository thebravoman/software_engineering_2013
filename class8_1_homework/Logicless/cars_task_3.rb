#/usr/bin/ruby

require 'csv'

list = File.open("car_sort.csv", "w")
list.write 'Varna'

if ARGV[0] == 'cars.csv'
    CSV.foreach(ARGV[0]) do |row|
            if ARGV[1].length == 1
                if row[0][0] == ARGV[1]
                    row[0][0] == ARGV[1]
                    list.puts
                    list.write row
                end
            elsif ARGV[1].length == 2
                if row[0][0..1] == ARGV[1]
                    row[0][0..1] == ARGV[1]
                    list.puts
                    list.write row
                end
            end
    end
else 
    puts 'ERROR ! Wrong csv file argument.'
end
list.close
