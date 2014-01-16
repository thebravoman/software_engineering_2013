	
require 'csv'
godini = ARGV[1].to_i
array = Array.new
CSV.foreach(ARGV[0]) do |row|
  if godini <= row[1].to_i + 2 and godini >= row[1].to_i - 2 and row[3] == "Sama"
            array << row
      end
  end
     
  array.sort_by! {|e| e[1].to_i}
     
    CSV.open("momicheta_result.csv","w") do |csv|
            array.each do |e|
                    csv << e
            end
    end

