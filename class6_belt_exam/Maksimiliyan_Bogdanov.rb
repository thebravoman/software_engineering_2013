require 'csv'

CSV.open("bank_results.csv","wb")
    CSV.foreach(ARGV[0]) do |row|
        debit = gets
            if row[2].to_f > debit.to_f
                puts row[2].to_f
        
            end
    end
    
end
