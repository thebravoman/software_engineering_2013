require 'csv'

start_time = ARGV[0].split('/')
start_day = start_time[0].to_i
start_month = start_time[1].to_i
start_year = start_time[2].to_i
start_date = (start_year*100 + start_month)*100 + start_day;

end_time = ARGV[1].split('/') 
end_day = end_time[0].to_i
end_month = end_time[1].to_i
end_year = end_time[2].to_i
end_date = (end_year*100 + end_month)*100 + end_day;   

income = 0.00
expense = 0.00
CSV.foreach("bank.csv") do |row|
        time = row[0].split('/') 
        day = time[0].to_i
        month = time[1].to_i
        year = time[2].to_i
        date = (year*100 + month)*100 + day;  
        
        if (start_date <= date && end_date >= date)
                income = income + row[1].to_f
                expense = expense + row[2].to_f
        end
end

printf("%.2f,%.2f,%.2f",income,expense,income-expense)
