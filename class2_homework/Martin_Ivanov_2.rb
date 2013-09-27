require "csv"

m1=0.00

	CSV.foreach("bank.csv") do |row|
		m1+=row[1].to_f
	end

printf "%0.2f\n", m1  

=begin
	Spored men zadachata ne e pravilno formulirana. Ne stava qsno kakvo se tursi. 
        Kolonata s adres [1] ili M1 spored zadaden nachalen kapital. 
=end
