require 'csv'

prihod = 0.00
razhod = 0.00
balans = 0.00


    CSV.foreach("bank.csv") do |row|

	      if row[0]>=ARGV[0] && row[0]<=ARGV[1]

              prihod=prihod+row[1].to_f
              razhod=razhod+row[2].to_f
       
      	end
    end

balans=prihod-razhod

printf "%.2f,%.2f,%.2f",prihod,razhod,balans
