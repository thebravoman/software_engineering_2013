require 'csv'

max_income = 0.00
income = Array.new(0.00)
max_date = '';
CSV.foreach("bank.csv") do |row| 
        time = row[0].split('/') 
        day = time[0].to_i
        month = time[1].to_i
        year = time[2].to_i
        date = (year*100 + month)*100 + day
        income[date] = income[date].to_f + row[1].to_f 
        if (max_income < income[date])
                max_income = income[date]
                max_date = row[0];
        end
end

income.clear

printf("%s",max_date)
